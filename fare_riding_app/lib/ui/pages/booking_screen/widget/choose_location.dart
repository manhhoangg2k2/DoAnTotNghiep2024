// import 'package:fare_riding_app/constant/AppSize.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
//
// import '../../../../constant/AppColor.dart';
// import '../../../../constant/AppFont.dart';
// import '../../../common/TextBase.dart';
// import '../../Home/widget/custom_textfield.dart';
//
// class ChooseLocation extends StatelessWidget {
//   const ChooseLocation({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     TextEditingController controller = new TextEditingController();
//     return Scaffold(
//       body: Stack(
//         children: [
//           GoogleMap(
//             mapType: MapType.normal,
//             initialCameraPosition: CameraPosition(
//               target: LatLng(21.026638, 105.833253),
//               zoom: 14.0,
//             ),
//             myLocationEnabled: true,
//             myLocationButtonEnabled: true,
//             onMapCreated: (GoogleMapController controller) {
//               // _controller = controller;
//             },
//             circles: {
//               Circle(
//                 circleId: CircleId("currentLocationCircle"),
//                 center: LatLng(21.026638, 105.843253),
//                 radius: 1000, // Radius in meters
//                 fillColor: Colors.blue.withOpacity(0.2), // Blue color with opacity 0.2
//                 strokeColor: Colors.blue, // Blue stroke color
//                 strokeWidth: 2, // Stroke width
//               ),
//             },
//             markers: {
//               Marker(
//                 markerId: MarkerId("startPosition"),
//                 position: LatLng(21.026638, 105.833253),
//                 icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
//                 infoWindow: InfoWindow(
//                   title: 'My Location',
//                   // snippet: 'Hà Nội, Việt Nam',
//                 ),
//               ),
//               Marker(
//                 markerId: MarkerId("endPosition"),
//                 position: LatLng(21.026638, 105.833253),
//                 icon: BitmapDescriptor.defaultMarker,
//                 infoWindow: InfoWindow(
//                   title: 'Destination',
//                   // snippet: 'Hà Nội, Việt Nam',
//                 ),
//               ),
//             },
//             // polylines: Set<Polyline>.of(polylines.values),
//           ),
//
//         ],
//       ),
//     );
//   }
// }
