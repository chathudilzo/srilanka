import 'dart:convert';
import 'dart:math';
import 'package:location/location.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'package:dropdown_button2/dropdown_button2.dart';

import 'package:http/http.dart' as http;
class Province {
  String name;
  double lat;
  double long;
 

  Province({required this.name,required this.lat,required this.long});

  static List<Province> getProvinces() {
    return [
      Province(name: "Ampara", lat: 6.674, long: 81.221),
      Province(name: "Anuradhapura", lat: 8.238, long: 80.716),
      Province(name: "Badulla", lat: 6.958, long: 81.198),
      Province(name: "Batticaloa", lat: 7.650, long: 81.450),
      Province(name: "Colombo", lat: 6.922, long: 79.861),
      Province(name: "Galle", lat: 6.118, long: 80.272),
      Province(name: "Gampaha", lat: 6.828, long: 79.804),
      Province(name: "Hambantota", lat: 6.139, long: 81.182),
      Province(name: "Jaffna", lat: 9.667, long: 80.000),
      Province(name: "Kalutara", lat: 6.667, long: 79.800),
      Province(name: "Kandy", lat: 7.250, long: 80.700),
      Province(name: "Kilinochchi", lat: 8.917, long: 80.633),
      Province(name: "Kurunegala", lat: 7.278, long: 80.500),
      Province(name: "Mannar", lat: 9.083, long: 79.900),
      Province(name: "Matara", lat: 5.917, long: 80.500),
      Province(name: "Moneragala", lat: 6.500, long: 81.000),
      Province(name: "Polonnaruwa", lat: 8.117, long: 80.733),
      Province(name: "Ratnapura", lat: 6.583, long: 80.650),
      Province(name: "Trincomalee", lat: 8.750, long: 81.222),
      Province(name: "Vavuniya", lat: 9.000, long: 80.583),
    ];
  }
}











class MapBox extends StatefulWidget {
   MapBox({super.key,required this.destination,required this.isLoading});

  LatLng destination;
  bool isLoading;

  @override
  State<MapBox> createState() => _MapBoxState();
}

class _MapBoxState extends State<MapBox> {

late GoogleMapController mapController;
List <Province> provinces=[];
LatLng? _userLocation;
double distance=0;
LatLng destination=LatLng(6.1667, 80.7500);

TextEditingController _userLocationController=TextEditingController();
List<LatLng> polylineCoordinates=[];
 Set<Polyline> _polylines={};

  void _onMapCreated(GoogleMapController controller) {
    
    setState(() {
      _userLocationController.text='Colombo';
    });
    mapController = controller;

    getPolyPoints(_userLocationController.text);
  }



// Future<void> _convertAddressToLatLng(String address)async{
//   try{
//     print(address);
//     await dotenv.load();
//     String apiKey = dotenv.env['GOOGLE_MAP_API_KEY'].toString();
    
//         final LocatitonGeocoder geocoder = LocatitonGeocoder(apiKey);
//         final location = await geocoder.findAddressesFromQuery('kochi,kerala');

//     // List<Location> location=await locationFromAddress(address);

//     if(location!=null){
//      print("Latitude: ${location.first.coordinates}");
    
//       setState(() {
//         //

//       });
      

//     }
//   }catch(e){
//     print(e.toString());
//   }
// }

double calculateDistance(lat1,long1,lat2,long2){
    var p=0.017453292519943295;
    var a = 0.5 - cos((lat2 - lat1) * p)/2 + 
          cos(lat1 * p) * cos(lat2 * p) * 
          (1 - cos((long2 - long1) * p))/2;
    return 12742 * asin(sqrt(a));
  }


  void getPolyPoints(String name)async{
    Province? userDistrict;
   // print(provinces);
    for(var province in provinces){
      //print(province.name);
      if(province.name==name){
        
        userDistrict=province;
        break;
      }
    }
    print('userDist:$userDistrict');
   if(userDistrict!=null){
    _userLocation=LatLng(userDistrict.lat, userDistrict.long);
    print('userLoc$_userLocation');
   }else{
    //_userLocation=null;
    print('userLoc$_userLocation');
   }
   if(mapController!=null){
     PolylinePoints polylinePoints=PolylinePoints();
     print(polylinePoints);
     polylineCoordinates.clear();

    try{
      await dotenv.load();
    String apiKey = dotenv.env['GOOGLE_MAP_API_KEY'].toString();

print(_userLocation.toString());
print(destination.toString());

final String apiUrl = 'http://localhost:3000/directions';
final Map<String, String> requestData = {
'origin': '${destination.latitude},${destination.longitude}',
'destination':'${_userLocation?.latitude},${_userLocation?.longitude}',
'apiKey':apiKey
};
print(requestData);
final requestBody = json.encode(requestData);
//there is a problem with polyline
final response = await http.post(Uri.parse(apiUrl), body: requestBody);
if (response.statusCode == 200) {
final decodedResponse = jsonDecode(response.body);

final overviewPolylineString = decodedResponse['routes'][0]['overview_polyline']['points'].toString();
//final points = PolylinePoints().decodePolyline(overviewPolylineString);
//final polylineCoordinatesString = _polylineCoordinates.toString();
//_polylineCoordinates.addAll(points.map((point) => LatLng(point.latitude, point.longitude)));
 PolylinePoints polylinePoints=PolylinePoints();
     polylineCoordinates.clear();
  List<PointLatLng> result = polylinePoints.decodePolyline(overviewPolylineString);
  for (PointLatLng point in result) {
  LatLng latLng = LatLng(point.latitude, point.longitude);
  polylineCoordinates.add(latLng);
  }
    //PolylineResult result=await polylinePoints.getRouteBetweenCoordinates('', PointLatLng(destination.latitude, destination.longitude), PointLatLng(_userLocation!.latitude, _userLocation!.longitude));
    print(result);
    
    
    // if(result.points.isNotEmpty){
    //   result.points.forEach(
    //     (PointLatLng point)=>polylineCoordinates.add(
    //       LatLng(point.latitude, point.longitude)
    //   ),
    //   );



       double totalDistance=0;
       for(var i=0;i<polylineCoordinates.length-1;i++){
        totalDistance += calculateDistance(
                polylineCoordinates[i].latitude, 
                polylineCoordinates[i].longitude, 
                polylineCoordinates[i+1].latitude, 
                polylineCoordinates[i+1].longitude);
       }
      setState(() {
       distance=totalDistance;
print(distance);
      });
    }
    }catch(e){
      print(e.toString());
    }

    
   }
  }

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    provinces=Province.getProvinces();
    destination=LatLng(widget.destination.latitude, widget.destination.longitude);

  }

String? selectedValue;


  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return Stack(
                        children:[
                          Container(
                     
                         decoration:BoxDecoration(
                           borderRadius: BorderRadius.circular(10),
                           color: Colors.amber,
                         ) ,
                           child:widget.isLoading?LoadingAnimationWidget.beat(size:20,color: Colors.red ):
                                 GoogleMap(
                                 initialCameraPosition:CameraPosition(
                                   target:destination,
                                   zoom: 14),
                                   onMapCreated:_onMapCreated,
                                   markers: {
                                     Marker(markerId: MarkerId("Destination"), position: destination),
                                     if(_userLocation!=null) Marker(markerId: MarkerId("User"), position: _userLocation!),
                                    
                                    
                                   },
                                   polylines: {
                                     Polyline(
                                       polylineId: const PolylineId("route"),
                                       points: polylineCoordinates,
                                       color: Colors.red,
                                       width: 6,
                                     ),}
                                   ),
                           width:width*0.3,
                           height: height*0.8,
                                           
                         ),
                          Positioned(child: Card(
                            child:DropdownButtonHideUnderline(
          child: DropdownButton2<String>(
            isExpanded: true,
            hint:  Row(
              children: [
                Icon(
                  Icons.list,
                  size: 16,
                  color: Colors.yellow,
                ),
                SizedBox(
                  width: 4,
                ),
                Expanded(
                  child: Text(
                    'Select Item',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.yellow,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            items: provinces
                .map((province) => DropdownMenuItem<String>(
                      value: province.name,
                      child: Text(
                        province.name,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ))
                .toList(),
            value: selectedValue,
            onChanged: (String? value) {
              setState(() {
                selectedValue = value;
                print(value);
                getPolyPoints(value!);
              });
            },
            buttonStyleData: ButtonStyleData(
              height: 50,
              width: 160,
              padding: const EdgeInsets.only(left: 14, right: 14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: Colors.black26,
                ),
                color: Colors.redAccent,
              ),
              elevation: 2,
            ),
            iconStyleData: const IconStyleData(
              icon: Icon(
                Icons.arrow_forward_ios_outlined,
              ),
              iconSize: 14,
              iconEnabledColor: Colors.yellow,
              iconDisabledColor: Colors.grey,
            ),
            dropdownStyleData: DropdownStyleData(
              maxHeight: 200,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: Colors.redAccent,
              ),
              offset: const Offset(-20, 0),
              scrollbarTheme: ScrollbarThemeData(
                radius: const Radius.circular(40),
                thickness: MaterialStateProperty.all<double>(6),
                thumbVisibility: MaterialStateProperty.all<bool>(true),
              ),
            ),
            menuItemStyleData: const MenuItemStyleData(
              height: 40,
              padding: EdgeInsets.only(left: 14, right: 14),
            ),
          ),
        ),
                          ))
                        ]
                      );
  }
}