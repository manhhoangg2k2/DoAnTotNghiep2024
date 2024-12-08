import 'dart:async';
import 'dart:convert';

import 'package:fare_riding_app/blocs/app_cubit.dart';
import 'package:fare_riding_app/main.dart';
import 'package:fare_riding_app/models/enums/app_status.dart';
import 'package:fare_riding_app/models/response/fare/request_rides_res.dart';
import 'package:fare_riding_app/ui/pages/ride_process/argument/ride_process_argument.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../constant/AppColor.dart';
import '../../../../../di/app_module.dart';
import '../../../../../models/entities/location.dart';
import '../../../../../repository/main_repository.dart';
import '../../../../../router/route_config.dart';
import '../../../../common/MainButton.dart';
import '../../../../common/app_divider.dart';
import '../../../../common/app_function.dart';
import '../../../../common/app_text_styles.dart';
import '../../../../common/floating_action_button.dart';

class RequestRideDetail extends StatefulWidget {
  const RequestRideDetail({super.key, required this.requestRide});
  final RequestRide requestRide;

  @override
  State<RequestRideDetail> createState() => _RequestRideDetailState();
}

class _RequestRideDetailState extends State<RequestRideDetail> {
  late List<LatLng> latLngList;
  // late Timer? _timerRequestRide;

  Set<Polyline> _polyline = {};


  @override
  void initState() {
    // TODO: implement initState
    String validJsonString = widget.requestRide.coordinates.replaceAll(r'\"', '"');

    List<dynamic> jsonData = json.decode(validJsonString);

    List<Location> locations = jsonData.map((item) => Location.fromJson(item)).toList();

    latLngList = locations.map<LatLng>((coordinate) {
      return LatLng(coordinate.lat, coordinate.lng);
    }).toList();
    _polyline.add(
      Polyline(
        polylineId: PolylineId('Route'),
        points: latLngList,
        color: AppColor.primary,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final MainRepository mainRepo = getIt.get<MainRepository>();
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: CameraPosition(
              target: LatLng(double.parse(widget.requestRide.pickupLat),
                double.parse(widget.requestRide.pickupLng)),
              zoom: 14.0,
            ),
            polylines: _polyline,
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            onMapCreated: (GoogleMapController controller) {
              // _controller = controller;
            },
            markers: {
              Marker(
                markerId: MarkerId("startPosition"),
                position: LatLng(double.parse(widget.requestRide.pickupLat),
                    double.parse(widget.requestRide.pickupLng)),
                icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueBlue),
                infoWindow: InfoWindow(
                  title: 'My Location',
                ),
              ),
              Marker(
                markerId: MarkerId("endPosition"),
                position: LatLng(double.parse(widget.requestRide.dropoffLat),
                    double.parse(widget.requestRide.dropoffLng)),
                icon: BitmapDescriptor.defaultMarker,
                infoWindow: InfoWindow(
                  title: 'Destination',
                ),
              ),
            },
          ),
          LeftBackButton(),
          DraggableScrollableSheet(
            initialChildSize: 0.4.h, // 50% của màn hình
            minChildSize: 0.2, // Chiều cao nhỏ nhất là 50%
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
                      SingleChildScrollView(
                        controller: scrollController,
                        child: Column(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: SvgPicture.asset(
                                        'assets/svg/map_red.svg',
                                        height: 25,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 5,
                                      child: Text(
                                        widget.requestRide.pickupAddress,
                                        style: AppTextStyle.description,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                                SvgPicture.asset(
                                  'assets/svg/down_arrow.svg',
                                  height: 25,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: SvgPicture.asset(
                                        'assets/svg/map_green.svg',
                                        height: 25,
                                        color: AppColor.primary,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 5,
                                      child: Text(
                                        widget.requestRide.dropoffAddress,
                                        style: AppTextStyle.description,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SolidAppDivider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Tổng tiền',
                                  style: AppTextStyle.blackS16Bold
                                      .copyWith(fontSize: 20),
                                ),
                                Text(
                                  '${formatCurrency(double.parse(widget.requestRide.finalPrice))}đ',
                                  style: AppTextStyle.blackS16Bold.copyWith(
                                      fontSize: 20, color: AppColor.primary),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Khoảng cách',
                                  style: AppTextStyle.blackS16,
                                ),
                                Text(
                                  '${double.parse(widget.requestRide.distance) / 1000} km',
                                  style: AppTextStyle.blackS16,
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Thời gian ước tính',
                                  style: AppTextStyle.blackS16,
                                ),
                                Text(
                                  '${widget.requestRide.duration} phút',
                                  style: AppTextStyle.blackS16,
                                )
                              ],
                            ),
                            SolidAppDivider(),
                            // Row(
                            //   children: [
                            //     Expanded(child: Text("Tiền mặt")),
                            //     Container(
                            //       width: 1.0, // Đặt chiều rộng của đường viền
                            //       height: 30.0, // Đặt chiều cao cho đường viền
                            //       decoration: BoxDecoration(
                            //         border: Border(
                            //           left: BorderSide(
                            //             color: Color(0xFFD3D3D3), // Màu xám nhạt giống Divider
                            //             width: 1.0, // Độ dày của đường viền
                            //           ),
                            //         ),
                            //       ),
                            //     ),
                            //     SizedBox(width: 5,),
                            //     Expanded(child: Text("Giảm giá")),
                            //   ],
                            // ),
                            // SolidAppDivider(),
                            Mainbutton(text: 'Nhận chuyến xe', type: 1, onTap: () async {
                              try{
                                final result = await mainRepo.startRide(requestRide: widget.requestRide);
                                final response = await mainRepo.getDirection(startLocationLat: context.read<AppCubit>().state.currentLocation!.lat, startLocationLng: context.read<AppCubit>().state.currentLocation!.lng, endLocationLat: double.parse(widget.requestRide.pickupLat) , endLocationLng: double.parse(widget.requestRide.pickupLng));
                                await context.read<AppCubit>().updateCreatedTime(result.data!.id);
                                if(result.code == 200 || response.code == 200){
                                  List<LatLng> latLngList = response.data!.coordinates
                                      .map((location) => LatLng(location.lat, location.lng))
                                      .toList();
                                  Set<Polyline> _polyline = {};
                                  _polyline.add(
                                    Polyline(
                                      polylineId: PolylineId('Route'),
                                      points: latLngList,
                                      color: AppColor.primary,
                                    ),
                                  );
                                  context.read<AppCubit>().updateAppStatus(AppStatus.inProcess);
                                  context.read<AppCubit>().updateRideInfo(lat: double.parse(widget.requestRide.pickupLat) , lng: double.parse(widget.requestRide.pickupLng), address:  widget.requestRide.pickupAddress, polyline: _polyline, finalAddress: widget.requestRide.dropoffAddress, finalLat: double.parse(widget.requestRide.dropoffLat),finalLng: double.parse(widget.requestRide.dropoffLng));
                                  context.read<AppCubit>().subscribeToRideAction(result.data!.id);
                                  context.read<AppCubit>().publishLocation('driver/${context.read<AppCubit>().state.userInfo!.id}/rideProcess');
                                  Get.offAndToNamed(RouteConfig.rideProcess,
                                                    arguments: RideProcessArgument(ride_id: result.data!.id,coordinates: response.data!, customer_id: result.data!.customer.id, customer_name: result.data!.customer.name, customer_phone_num: result.data!.customer.phoneNumber, requestRide: widget.requestRide));
                                }
                              }catch(e){
                                print(e);
                              }
                            })
                          ],
                        ),
                      )
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
