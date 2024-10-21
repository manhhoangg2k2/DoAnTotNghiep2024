import 'package:fare_riding_app/constant/AppSize.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../../constant/AppColor.dart';
import '../../../../constant/AppFont.dart';
import '../../../common/TextBase.dart';
import '../widget/custom_textfield.dart';

class ChooseLocation extends StatelessWidget {
  const ChooseLocation({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = new TextEditingController();
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: CameraPosition(
              target: LatLng(21.026638, 105.833253),
              zoom: 14.0,
            ),
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            onMapCreated: (GoogleMapController controller) {
              // _controller = controller;
            },
            circles: {
              Circle(
                circleId: CircleId("currentLocationCircle"),
                center: LatLng(21.026638, 105.843253),
                radius: 1000, // Radius in meters
                fillColor: Colors.blue.withOpacity(0.2), // Blue color with opacity 0.2
                strokeColor: Colors.blue, // Blue stroke color
                strokeWidth: 2, // Stroke width
              ),
            },
            markers: {
              Marker(
                markerId: MarkerId("startPosition"),
                position: LatLng(21.026638, 105.833253),
                icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
                infoWindow: InfoWindow(
                  title: 'My Location',
                  // snippet: 'Hà Nội, Việt Nam',
                ),
              ),
              Marker(
                markerId: MarkerId("endPosition"),
                position: LatLng(21.026638, 105.833253),
                icon: BitmapDescriptor.defaultMarker,
                infoWindow: InfoWindow(
                  title: 'Destination',
                  // snippet: 'Hà Nội, Việt Nam',
                ),
              ),
            },
            // polylines: Set<Polyline>.of(polylines.values),
          ),
          Positioned(
            bottom: 110,
            left: 20,
            right: 20,
            child: ElevatedButton(
              onPressed: () {
                showMaterialModalBottomSheet(
                  context: context,
                  builder: (context) => Container(
                    padding: EdgeInsets.all(AppSizes.size_20),
                    height: 500,
                    child: Center(
                      child: Column(
                        children: [
                          CustomTextField(
                            controller: controller,
                              hintText: 'Điểm đón',
                              iconPath: 'assets/svg/location_from.svg'
                          ),
                          SizedBox(height: 10,),
                          CustomTextField(
                            controller: controller,
                              hintText: 'Điểm đến',
                              iconPath: 'assets/svg/to_location.svg',
                              iconColor: AppColor.red_F2F,
                          ),
                          SizedBox(height: 10,),
                          Container(
                            height: 40,
                            padding: EdgeInsets.all(8),
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/svg/add_location.svg',
                                      height: 25,
                                      color: AppColor.main,
                                    ),
                                    // SizedBox(width: 5,),
                                    TextBase(
                                      text: "Thêm nhà",
                                      fontWeight: AppFonts.medium,
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/svg/add_location.svg',
                                      height: 25,
                                      color: AppColor.main,
                                    ),
                                    // SizedBox(width: 1,),
                                    TextBase(
                                      text: "Thêm Công ty",
                                      fontWeight: AppFonts.medium,
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/svg/add_location.svg',
                                      height: 25,
                                      color: AppColor.main,
                                    ),
                                    // SizedBox(width: 5,),
                                    TextBase(
                                      text: "Thêm địa chỉ",
                                      fontWeight: AppFonts.medium,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ),
                  ),
                );
              },
              child: Text('Show Modal Bottom Sheet'),
            ),
          ),
        ],
      ),
    );
  }
}
