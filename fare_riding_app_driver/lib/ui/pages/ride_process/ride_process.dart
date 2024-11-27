import 'package:fare_riding_app/blocs/app_cubit.dart';
import 'package:fare_riding_app/constant/AppColor.dart';
import 'package:fare_riding_app/models/response/user/user_info_res.dart';
import 'package:fare_riding_app/ui/common/MainButton.dart';
import 'package:fare_riding_app/ui/common/app_colors.dart';
import 'package:fare_riding_app/ui/common/app_images.dart';
import 'package:fare_riding_app/ui/pages/ride_process/ride_process_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../models/entities/location.dart';
import '../../common/app_text_styles.dart';

class RideProcess extends StatefulWidget {
  const RideProcess({super.key});

  @override
  State<RideProcess> createState() => _RideProcessState();
}

class _RideProcessState extends State<RideProcess> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RideProcessCubit>(
      create: (context) => RideProcessCubit()..init(),
      child: RideProcessScreen(),
    );
  }
}

class RideProcessScreen extends StatefulWidget {
  const RideProcessScreen({super.key});

  @override
  State<RideProcessScreen> createState() => _RideProcessScreenState();
}

class _RideProcessScreenState extends State<RideProcessScreen> {
  late UserInfoRes userInfoRes;
  late RideProcessCubit _cubit;
  late Location currentLocation ;

  @override
  void initState() {
    _cubit = context.read<RideProcessCubit>();
    userInfoRes = context.read<AppCubit>().state.userInfo!;
    currentLocation = context.read<AppCubit>().state.currentLocation!;
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: CameraPosition(
              target: LatLng(currentLocation.lat,
                  currentLocation.lng),
              zoom: 14.0,
            ),
            polylines: _cubit.state.polyline,
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            onMapCreated: (GoogleMapController controller) {
              // _controller = controller;
            },
            // circles: {
            //   Circle(
            //     circleId: CircleId("currentLocationCircle"),
            //     center: LatLng(double.parse(widget.requestRide.dropoffLat),
            //         double.parse(widget.requestRide.dropoffLng)),
            //     radius: 1000, // Radius in meters
            //     fillColor:
            //     Colors.blue.withOpacity(0.2), // Blue color with opacity 0.2
            //     strokeColor: Colors.blue, // Blue stroke color
            //     strokeWidth: 2, // Stroke width
            //   ),
            // },
            markers: {
              context.read<AppCubit>().state.currentLocationIcon == null ?
              Marker(
                markerId: MarkerId("startPosition"),
                position: LatLng(currentLocation.lat,
                    currentLocation.lng),
                icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueBlue),
                infoWindow: InfoWindow(
                  title: 'My Location',
                ),
              ) :
              Marker(
                markerId: MarkerId("startPosition"),
                position: LatLng(currentLocation.lat,
                    currentLocation.lng),
                icon: context.read<AppCubit>().state.currentLocationIcon!,
                infoWindow: InfoWindow(
                  title: 'My Location',
                ),
              )
              ,
              Marker(
                markerId: MarkerId("endPosition"),
                position: LatLng(_cubit.state.endLocation!.lat,
                    _cubit.state.endLocation!.lng),
                icon: BitmapDescriptor.defaultMarker,
                infoWindow: InfoWindow(
                  title: 'Destination',
                ),
              ),
            },
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.35, // 50% của màn hình
            minChildSize: 0.3, // Chiều cao nhỏ nhất là 50%
            maxChildSize: 0.8, // Chiều cao lớn nhất là 80%
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0),
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Container(
                        width: 60,
                        height: 6,
                        margin: const EdgeInsets.symmetric(vertical: 10.0),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(3.0),
                        ),
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(flex: 2,child: Text('Đi tới', style: AppTextStyle.blackS18Bold,)),
                                Expanded(
                                  flex: 5,
                                  child: Text(_cubit.rideProcessArgument.requestRide.pickupAddress,style: AppTextStyle.blackS16Bold.copyWith(color: AppColors.primary),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(flex: 2,child: Text('Khoảng cách', style: AppTextStyle.blackS14.copyWith(color: AppColors.gray),)),
                                Expanded(
                                  flex: 5,
                                  child: Text("${int.parse(_cubit.rideProcessArgument.requestRide.distance)/1000}km",style: AppTextStyle.blackS14Bold.copyWith(color: AppColors.gray),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,),
                                )
                              ],
                            ),
                            SizedBox(height: 10,),
                            Text("Khách hàng", style: AppTextStyle.blackS18Bold,),
                            Padding(padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5), child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 1,
                                      blurRadius: 5,
                                      offset: Offset(0, 3), // changes position of shadow
                                    ),
                                  ],
                                  color: AppColor.white
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(AppImages.icAvatar, height: 35,),
                                      SizedBox(width: 10,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(_cubit.rideProcessArgument.customer_name, style: AppTextStyle.blackS16Bold,),
                                          Text(_cubit.rideProcessArgument.customer_phone_num, style: AppTextStyle.blackS14.copyWith(color: AppColors.gray),),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Image.asset(AppImages.icPhone, height: 30, color: AppColor.primary,)
                                ],
                              ),

                            ),),
                            SizedBox(height: 10,),
                            Row(
                              children: [
                                Expanded(child: Mainbutton(text: "Huỷ", type: 0, onTap: (){})),
                                Expanded(child: Mainbutton(text: "Đã đón", type: 1, onTap: (){}))
                              ],
                            )
                          ],
                        ),
                      )
                      // SingleChildScrollView(
                      //   child: Column(
                      //     children: [
                      //       Column(
                      //         mainAxisAlignment: MainAxisAlignment.center,
                      //         children: [
                      //           Row(
                      //             mainAxisAlignment: MainAxisAlignment.start,
                      //             children: [
                      //               Expanded(
                      //                 flex: 1,
                      //                 child: SvgPicture.asset(
                      //                   'assets/svg/map_red.svg',
                      //                   height: 25,
                      //                 ),
                      //               ),
                      //               Expanded(
                      //                 flex: 5,
                      //                 child: Text(
                      //                   widget.requestRide.pickupAddress,
                      //                   style: AppTextStyle.description,
                      //                   maxLines: 2,
                      //                   overflow: TextOverflow.ellipsis,
                      //                 ),
                      //               ),
                      //             ],
                      //           ),
                      //           SvgPicture.asset(
                      //             'assets/svg/down_arrow.svg',
                      //             height: 25,
                      //           ),
                      //           Row(
                      //             children: [
                      //               Expanded(
                      //                 flex: 1,
                      //                 child: SvgPicture.asset(
                      //                   'assets/svg/map_green.svg',
                      //                   height: 25,
                      //                   color: AppColor.primary,
                      //                 ),
                      //               ),
                      //               Expanded(
                      //                 flex: 5,
                      //                 child: Text(
                      //                   widget.requestRide.dropoffAddress,
                      //                   style: AppTextStyle.description,
                      //                   maxLines: 2,
                      //                   overflow: TextOverflow.ellipsis,
                      //                 ),
                      //               ),
                      //             ],
                      //           ),
                      //         ],
                      //       ),
                      //       SolidAppDivider(),
                      //       Row(
                      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //         children: [
                      //           Text(
                      //             'Tổng tiền',
                      //             style: AppTextStyle.blackS16Bold
                      //                 .copyWith(fontSize: 20),
                      //           ),
                      //           Text(
                      //             '${formatCurrency(double.parse(widget.requestRide.finalPrice))}đ',
                      //             style: AppTextStyle.blackS16Bold.copyWith(
                      //                 fontSize: 20, color: AppColor.primary),
                      //           )
                      //         ],
                      //       ),
                      //       Row(
                      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //         children: [
                      //           Text(
                      //             'Khoảng cách',
                      //             style: AppTextStyle.blackS16,
                      //           ),
                      //           Text(
                      //             '${double.parse(widget.requestRide.distance) / 1000} km',
                      //             style: AppTextStyle.blackS16,
                      //           )
                      //         ],
                      //       ),
                      //       Row(
                      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //         children: [
                      //           Text(
                      //             'Thời gian ước tính',
                      //             style: AppTextStyle.blackS16,
                      //           ),
                      //           Text(
                      //             '${widget.requestRide.duration} phút',
                      //             style: AppTextStyle.blackS16,
                      //           )
                      //         ],
                      //       ),
                      //       SolidAppDivider(),
                      //       // Row(
                      //       //   children: [
                      //       //     Expanded(child: Text("Tiền mặt")),
                      //       //     Container(
                      //       //       width: 1.0, // Đặt chiều rộng của đường viền
                      //       //       height: 30.0, // Đặt chiều cao cho đường viền
                      //       //       decoration: BoxDecoration(
                      //       //         border: Border(
                      //       //           left: BorderSide(
                      //       //             color: Color(0xFFD3D3D3), // Màu xám nhạt giống Divider
                      //       //             width: 1.0, // Độ dày của đường viền
                      //       //           ),
                      //       //         ),
                      //       //       ),
                      //       //     ),
                      //       //     SizedBox(width: 5,),
                      //       //     Expanded(child: Text("Giảm giá")),
                      //       //   ],
                      //       // ),
                      //       // SolidAppDivider(),
                      //       Mainbutton(text: 'Nhận chuyến xe', type: 1, onTap: () async {
                      //         try{
                      //           final result = await mainRepo.startRide(requestRide: widget.requestRide);
                      //           final response = await mainRepo.getDirection(startLocationLat: context.read<AppCubit>().state.currentLocation!.lat, startLocationLng: context.read<AppCubit>().state.currentLocation!.lng, endLocationLat: double.parse(widget.requestRide.pickupLat) , endLocationLng: double.parse(widget.requestRide.pickupLng));
                      //           if(result.code == 200 || response.code == 200){
                      //             Get.offAndToNamed(RouteConfig.rideProcess,
                      //                 arguments: RideProcessArgument(coordinates: response.data!, customer_id: result.data!.customer.id, customer_name: result.data!.customer.name, customer_phone_num: result.data!.customer.phoneNumber, requestRide: widget.requestRide));
                      //           }
                      //           else{
                      //
                      //           }
                      //         }catch(e){
                      //           print(e);
                      //         }
                      //       })
                      //     ],
                      //   ),
                      // )
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

