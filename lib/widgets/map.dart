// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class MapWidget extends StatefulWidget {
//   const MapWidget({super.key,required this.point});

//   final GeoPoint point;

//   @override
//   State<MapWidget> createState() => _MapWidgetState();
// }

// class _MapWidgetState extends State<MapWidget> {

//   GoogleMapController? _mapController;
  

//   @override
//   Widget build(BuildContext context) {
//     return GoogleMap(
//       initialCameraPosition:CameraPosition(
//         target: LatLng(widget.point.longitude,widget.point.latitude),
//         zoom: 14),
//         onMapCreated: (controller) {
          
//           _mapController=controller;
//         },
//         markers: {
//           Marker(markerId: MarkerId('Province'),
//           position: LatLng(widget.point.latitude,widget.point.longitude),
//           infoWindow: InfoWindow(
//                     // title: _province.name,
//                     // snippet: _province.details,
//                   ),
//           )
//         },
//         );
//   }
// }