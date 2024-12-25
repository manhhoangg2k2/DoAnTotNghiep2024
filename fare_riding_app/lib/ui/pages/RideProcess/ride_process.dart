import 'dart:convert';
import 'dart:math';

import 'package:fare_riding_app/blocs/app_cubit.dart';
import 'package:fare_riding_app/models/enums/app_status.dart';
import 'package:fare_riding_app/models/enums/ride_status.dart';
import 'package:fare_riding_app/models/response/fare/ride_action_res.dart';
import 'package:fare_riding_app/ui/common/app_colors.dart';
import 'package:fare_riding_app/ui/common/app_dialog.dart';
import 'package:fare_riding_app/ui/common/app_loading.dart';
import 'package:fare_riding_app/ui/pages/RideProcess/completed_ride/cancel_ride_screen/cancel_ride_screen.dart';
import 'package:fare_riding_app/ui/pages/RideProcess/completed_ride/success_ride.dart';
import 'package:fare_riding_app/ui/pages/RideProcess/ride_process_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../constant/AppColor.dart';
import '../../../router/route_config.dart';
import '../../common/MainButton.dart';
import '../../common/MainTextField.dart';
import '../../common/app_bottom_sheet.dart';
import '../../common/app_divider.dart';
import '../../common/app_function.dart';
import '../../common/app_images.dart';
import '../../common/app_text_styles.dart';

class RideProcess extends StatelessWidget {
  const RideProcess({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RideProcessCubit>(
        create: (context) => RideProcessCubit()..init(), child: _RideProcess());
  }
}

class _RideProcess extends StatefulWidget {
  const _RideProcess({super.key});

  @override
  State<_RideProcess> createState() => _RideProcessState();
}

class _RideProcessState extends State<_RideProcess> {
  late RideProcessCubit _cubit;

  @override
  void initState() {
    _cubit = context.read<RideProcessCubit>();
    // TODO: implement initState
    super.initState();
  }

  String generateRandomCode() {
    const letters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    const numbers = '0123456789';
    Random random = Random();

    String randomLetters = String.fromCharCodes(Iterable.generate(
        3, (_) => letters.codeUnitAt(random.nextInt(letters.length))));
    String randomNumbers = String.fromCharCodes(Iterable.generate(
        3, (_) => numbers.codeUnitAt(random.nextInt(numbers.length))));

    return randomLetters + randomNumbers;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          return Stack(
            children: [
              if (context.read<AppCubit>().state.driverLocation != null) ...[
                GoogleMap(
                  mapType: MapType.normal,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(
                        context.read<AppCubit>().state.driverLocation!.lat,
                        context.read<AppCubit>().state.driverLocation!.lng),
                    zoom: 14.0,
                  ),
                  polylines: context.read<AppCubit>().state.polyline,
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                  onMapCreated: (GoogleMapController controller) {
                    // _controller = controller;
                  },
                  markers: {
                    // Marker(
                    //   markerId: MarkerId("startPosition"),
                    //   position: LatLng(
                    //       context.read<AppCubit>().state.driverLocation!.lat,
                    //       context.read<AppCubit>().state.driverLocation!.lng),
                    //   // icon: context.read<AppCubit>().state.currentLocationIcon!,
                    //   icon: BitmapDescriptor.defaultMarkerWithHue(
                    //       BitmapDescriptor.hueBlue),
                    //   infoWindow: InfoWindow(
                    //     title: 'My Location',
                    //   ),
                    // ),
                    _cubit.rideRes.driver!.vehicle!.vehicleTypeId == 3 ?
                    Marker(
                      markerId: MarkerId("startPosition"),
                      position: LatLng(double.parse(_cubit.rideRes.driver!.lastestLocationLat!),
                          double.parse(_cubit.rideRes.driver!.lastestLocationLng!)),
                      icon: context
                          .read<AppCubit>()
                          .state
                          .motorbikeIcon!,
                      infoWindow: InfoWindow(
                        title: 'My Location',
                      ),
                    ):
                    Marker(
                      markerId: MarkerId("startPosition"),
                      position: LatLng(double.parse(_cubit.rideRes.driver!.lastestLocationLat!),
                          double.parse(_cubit.rideRes.driver!.lastestLocationLng!)),
                      icon: context
                          .read<AppCubit>()
                          .state
                          .currentLocationIcon!,
                      infoWindow: InfoWindow(
                        title: 'My Location',
                      ),
                    )
                    ,
                    Marker(
                      markerId: MarkerId("endPosition"),
                      position: LatLng(
                          double.parse(_cubit.rideRes.ride!.pickupLat!),
                          double.parse(_cubit.rideRes.ride!.pickupLat!)),
                      icon: BitmapDescriptor.defaultMarker,
                      infoWindow: InfoWindow(
                        title: 'Destination',
                      ),
                    ),
                  },
                ),
                DraggableScrollableSheet(
                  initialChildSize: 0.63, // 50% của màn hình
                  minChildSize: 0.2, // Chiều cao nhỏ nhất là 50%
                  maxChildSize: 0.8, // Chiều cao lớn nhất là 80%
                  builder: (BuildContext context,
                      ScrollController scrollController) {
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
                              margin:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(3.0),
                              ),
                            ),
                            SingleChildScrollView(
                              controller: scrollController,
                              child: Column(
                                children: [
                                  Text(
                                    context
                                        .read<AppCubit>()
                                        .state
                                        .appStatus
                                        .getLabel,
                                    style: AppTextStyle.blackS16Bold.copyWith(
                                        color: context
                                            .read<AppCubit>()
                                            .state
                                            .appStatus
                                            .getColor),
                                  ),
                                  Text(
                                    "Khoảng ${context.read<AppCubit>().state.driverDuration == null || context.read<AppCubit>().state.driverDuration == 0 ? '...' : context.read<AppCubit>().state.driverDuration} phút",
                                    style: AppTextStyle.blackS14Bold
                                        .copyWith(color: AppColors.gray),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: SvgPicture.asset(
                                              'assets/svg/map_red.svg',
                                              height: 20,
                                            ),
                                          ),
                                          Expanded(
                                            flex: 7,
                                            child: Text(
                                              _cubit
                                                  .rideRes.ride!.pickupAddress!,
                                              style: AppTextStyle.description
                                                  .copyWith(fontSize: 12),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: SvgPicture.asset(
                                              'assets/svg/map_green.svg',
                                              height: 20,
                                              color: AppColor.primary,
                                            ),
                                          ),
                                          Expanded(
                                            flex: 7,
                                            child: Text(
                                              _cubit.rideRes.ride!
                                                  .dropoffAddress!,
                                              style: AppTextStyle.description
                                                  .copyWith(fontSize: 12),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SolidAppDivider(),
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Tài xế",
                                        style: AppTextStyle.blackS16Bold
                                            .copyWith(),
                                      )),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    child: Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              spreadRadius: 1,
                                              blurRadius: 5,
                                              offset: Offset(0,
                                                  3), // changes position of shadow
                                            ),
                                          ],
                                          color: AppColor.white),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Image.asset(
                                                    AppImages.icAvatar,
                                                    height: 35,
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        _cubit.rideRes.driver!
                                                            .name!,
                                                        style: AppTextStyle
                                                            .blackS16Bold,
                                                      ),
                                                      Text(
                                                        _cubit.rideRes.driver!
                                                            .phoneNumber!,
                                                        style: AppTextStyle
                                                            .blackS14
                                                            .copyWith(
                                                                color: AppColors
                                                                    .gray),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              InkWell(
                                                onTap: ()=> launchUrlString("tel://${_cubit.rideRes.driver!
                                                    .phoneNumber!}"),
                                                child: Image.asset(
                                                  AppImages.icPhone,
                                                  height: 30,
                                                  color: AppColor.primary,
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Phương tiện",
                                        style: AppTextStyle.blackS16Bold
                                            .copyWith(),
                                      )),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    child: Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              spreadRadius: 1,
                                              blurRadius: 5,
                                              offset: Offset(0,
                                                  3), // changes position of shadow
                                            ),
                                          ],
                                          color: AppColor.white),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                AppImages.icMotorbike,
                                                height: 35,
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    _cubit.rideRes.driver!
                                                        .vehicle!.name!,
                                                    style: AppTextStyle
                                                        .blackS14Bold,
                                                  ),
                                                  Text(
                                                    "${_cubit.rideRes.driver!.vehicle!.description!} - ${_cubit.rideRes.driver!.vehicle!.code!}",
                                                    style: AppTextStyle.blackS12
                                                        .copyWith(
                                                            color:
                                                                AppColors.gray),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SolidAppDivider(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Thanh toán',
                                        style: AppTextStyle.blackS16Bold
                                            .copyWith(fontSize: 20),
                                      ),
                                      Text(
                                        '${formatCurrency(double.parse(_cubit.rideRes.ride!.finalPrice!))}đ',
                                        style: AppTextStyle.blackS16Bold
                                            .copyWith(
                                                fontSize: 20,
                                                color: AppColor.primary),
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Khoảng cách',
                                        style: AppTextStyle.blackS16,
                                      ),
                                      Text(
                                        '${double.parse(_cubit.rideRes.ride!.distance!) / 1000} km',
                                        style: AppTextStyle.blackS16,
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Thời gian ước tính',
                                        style: AppTextStyle.blackS16,
                                      ),
                                      Text(
                                        '${double.parse(_cubit.rideRes.ride!.duration!)} phút',
                                        style: AppTextStyle.blackS16,
                                      )
                                    ],
                                  ),
                                  SolidAppDivider(),
                                  // FloatingActionButton(onPressed: ()=>Navigator.push(context,MaterialPageRoute(builder: (context) => CompletedRideScreen(rideRes: _cubit.rideRes)))),
                                  if (context
                                          .read<AppCubit>()
                                          .state
                                          .appStatus ==
                                      AppStatus.inProcess) ...[
                                    ErrorButton(
                                        text: 'Huỷ',
                                        onTap: () {
                                          AppBottomSheet.showBottomSheet(
                                            title: "Xác nhận huỷ chuyến xe",
                                            body: StatefulBuilder(
                                              builder: (context, setState) {
                                                TextEditingController commentController = TextEditingController();
                                                bool isConfirm = true;
                                                return Padding(
                                                  padding: const EdgeInsets.all(15),
                                                  child: Column(
                                                    children: [
                                                      MainTextField(
                                                        controller: commentController,
                                                        initial: '',
                                                        hint: 'Nhập vào lý do huỷ',
                                                      ),
                                                      Row(
                                                        children: [
                                                          Checkbox(
                                                            value: isConfirm,
                                                            onChanged: (value) {
                                                              setState(() {
                                                                isConfirm = value!;
                                                              });
                                                            },
                                                          ),
                                                          Text("Xác nhận trước khi huỷ chuyến xe"),
                                                        ],
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.symmetric(horizontal: 15),
                                                        child: Column(
                                                          children: [
                                                            isConfirm
                                                                ? Mainbutton(
                                                              text: "Huỷ chuyến xe",
                                                              type: 1,
                                                              onTap: () async {
                                                                // context.read<AppCubit>().updateAppStatus(AppStatus.free);
                                                                // _cubit.cancelRide(commentController.text);
                                                                // context.read<AppCubit>().publishMessage(
                                                                //   "ride/${_cubit.rideRes.ride!.id}/action",
                                                                //   jsonEncode(
                                                                //     RideActionRes(
                                                                //       id: generateRandomCode(),
                                                                //       publisher: 'driver',
                                                                //       action: 'cancel',
                                                                //     ).toJson(),
                                                                //   ),
                                                                // );
                                                                // context.read<AppCubit>().unsubscribeFromTopic(
                                                                //   "ride/${_cubit.rideProcessArgument.ride_id}/action",
                                                                // );
                                                                // context.read<AppCubit>().timer!.cancel();
                                                                AppLoadingIndicator.show(
                                                                              context);
                                                                          await _cubit.cancelRide(commentController.text);
                                                                          context
                                                                              .read<AppCubit>()
                                                                              .updateAppStatus(
                                                                                  AppStatus.free);
                                                                          context.read<AppCubit>().publishMessage(
                                                                              "ride/${_cubit.rideRes.ride!.id}/action",
                                                                              jsonEncode(RideActionRes(
                                                                                      id:
                                                                                          generateRandomCode(),
                                                                                      publisher:
                                                                                          'customer',
                                                                                      action: 'cancel')
                                                                                  .toJson()));
                                                                          context
                                                                              .read<AppCubit>()
                                                                              .unsubscribeFromTopic(
                                                                                  "ride/${_cubit.rideRes.ride!.id}/action");
                                                                          AppLoadingIndicator.hide();

                                                                          // Get.toNamed(
                                                                          //     RouteConfig.home);
                                                                Navigator.push(context,MaterialPageRoute(builder: (context) => CancelRideScreen(rideRes: _cubit.rideRes, actor: 'customer', reason: commentController.text)));
                                                              },
                                                            )
                                                                : MainbuttonDisable(
                                                              text: "Huỷ chuyến xe",
                                                              type: 1,
                                                              onTap: () {},
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            ),
                                          );
                                          // AppDialog.showConfirmDialog(
                                          //     text: "Bạn có chắn muốn huỷ?",
                                          //     onConfirm: () async {
                                          //       AppLoadingIndicator.show(
                                          //           context);
                                          //       await _cubit.cancelRide();
                                          //       context
                                          //           .read<AppCubit>()
                                          //           .updateAppStatus(
                                          //               AppStatus.free);
                                          //       context.read<AppCubit>().publishMessage(
                                          //           "ride/${_cubit.rideRes.ride!.id}/action",
                                          //           jsonEncode(RideActionRes(
                                          //                   id:
                                          //                       generateRandomCode(),
                                          //                   publisher:
                                          //                       'customer',
                                          //                   action: 'cancel')
                                          //               .toJson()));
                                          //       context
                                          //           .read<AppCubit>()
                                          //           .unsubscribeFromTopic(
                                          //               "ride/${_cubit.rideRes.ride!.id}/action");
                                          //       AppLoadingIndicator.hide();
                                          //       Get.toNamed(
                                          //           RouteConfig.home);
                                          //     });
                                          // // _cubit.requestRide(_cubit.state.rideEntity!.calculationRes!, 'cash',);
                                          // // context.read<AppCubit>().subscribeToRequestRideTopic(context.read<AppCubit>().state.userInfo!.id.toString());
                                        })
                                  ]
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                )
              ],
              if (context.read<AppCubit>().state.driverLocation == null) ...[
                Center(child: Container(height:30,width: 30, child: LoadingIndicator(indicatorType: Indicator.ballBeat)), heightFactor: 50,)
              ]
            ],
          );
        },
      ),
    );
  }
}
