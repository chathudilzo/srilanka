// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:flutter_polyline_points/flutter_polyline_points.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';


// import 'package:google_maps_flutter_web/google_maps_flutter_web.dart' as gmfw;
// import 'package:google_maps_flutter_web/google_maps_flutter_web.dart';

// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class MapWithPolyline extends StatefulWidget {
// @override
// _MapWithPolylineState createState() => _MapWithPolylineState();
// }

// class _MapWithPolylineState extends State<MapWithPolyline> {
// List<LatLng> _polylineCoordinates = [];
// Set<Polyline> _polylines={};
//   final LatLng _destination = const LatLng(6.1667, 80.7500);
//  LatLng? _userLocation;
//   double distance=0;
// @override
// void initState() {
// super.initState();
// // Fetch and plot polyline when the widget is created
// fetchAndPlotPolyline();
// }

// void fetchAndPlotPolyline() async {
// final String apiUrl = 'http://localhost:3000/directions';
// final Map<String, dynamic> requestData = {
// 'origin': '6.879744, 80.506941',
// 'destination': '7.316667, 81.216667',
// };

// final response = await http.post(Uri.parse(apiUrl), body: requestData);

// if (response.statusCode == 200) {
// final decodedResponse = jsonDecode(response.body);

// final overviewPolylineString = decodedResponse['routes'][0]['overview_polyline'].toString().substring(0, 1285);
// //final points = PolylinePoints().decodePolyline(overviewPolylineString);
// //final polylineCoordinatesString = _polylineCoordinates.toString();
// //_polylineCoordinates.addAll(points.map((point) => LatLng(point.latitude, point.longitude)));
//  PolylinePoints polylinePoints=PolylinePoints();
//      _polylineCoordinates.clear();
//   List<PointLatLng> result = polylinePoints.decodePolyline(overviewPolylineString);
//   for (PointLatLng point in result) {
//   LatLng latLng = LatLng(point.latitude, point.longitude);
//   _polylineCoordinates.add(latLng);
//   }

// print(_polylineCoordinates);   



//  double totalDistance=0;
//        for(var i=0;i<_polylineCoordinates.length-1;i++){
//         totalDistance += calculateDistance(
//                 _polylineCoordinates[i].latitude, 
//                 _polylineCoordinates[i].longitude, 
//                 _polylineCoordinates[i+1].latitude, 
//                 _polylineCoordinates[i+1].longitude);
//        }
//       setState(() {
//        distance=totalDistance;
//        print(distance);

//       });
// } else {
// print('Failed to fetch directions. Status code: ${response.statusCode}');
// }
// }

// List<LatLng> _decodePolyline(String encodedPoints) {
// List<PointLatLng> points = PolylinePoints().decodePolyline(encodedPoints);
// List<LatLng> coordinates = points.map((point) => LatLng(point.latitude, point.longitude)).toList();
// return coordinates;
// }
// double calculateDistance(lat1,long1,lat2,long2){
//     var p=0.017453292519943295;
//     var a = 0.5 - cos((lat2 - lat1) * p)/2 + 
//           cos(lat1 * p) * cos(lat2 * p) * 
//           (1 - cos((long2 - long1) * p))/2;
//     return 12742 * asin(sqrt(a));
//   }
// @override
// Widget build(BuildContext context) {
// return Scaffold(
// appBar: AppBar(
// title: Text('Map with Polyline'),
// ),
// body: GoogleMap(
// initialCameraPosition: CameraPosition(
// target: LatLng(7.2026, 79.8737), // Set your initial map center
// zoom: 12.0,
// ),
// onMapCreated: (controller) {
// },
// polylines: {
// Polyline(

// polylineId: PolylineId('route'),
// points: _polylineCoordinates,
// color: Color.fromARGB(255, 233, 51, 5),
// width: 10,
// ),
// },
// ),
// );
// }
// }