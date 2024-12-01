import 'dart:convert';
import 'dart:math';

import 'package:fare_riding_app/blocs/app_cubit.dart';
import 'package:fare_riding_app/constant/AppColor.dart';
import 'package:fare_riding_app/models/response/user/user_info_res.dart';
import 'package:fare_riding_app/ui/common/MainButton.dart';
import 'package:fare_riding_app/ui/common/MainTextField.dart';
import 'package:fare_riding_app/ui/common/app_bottom_sheet.dart';
import 'package:fare_riding_app/ui/common/app_colors.dart';
import 'package:fare_riding_app/ui/common/app_dialog.dart';
import 'package:fare_riding_app/ui/common/app_images.dart';
import 'package:fare_riding_app/ui/common/app_snackbar.dart';
import 'package:fare_riding_app/ui/pages/ride_process/ride_process_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../models/entities/location.dart';
import '../../../models/enums/app_status.dart';
import '../../../models/response/fare/ride_action_res.dart';
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
  late Location currentLocation;

  @override
  void initState() {
    _cubit = context.read<RideProcessCubit>();
    userInfoRes = context.read<AppCubit>().state.userInfo!;
    currentLocation = context.read<AppCubit>().state.currentLocation!;
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
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: CameraPosition(
                  target: LatLng(currentLocation.lat, currentLocation.lng),
                  zoom: 14.0,
                ),
                polylines: context.read<AppCubit>().state.polyline,
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
                  context.read<AppCubit>().state.currentLocationIcon == null
                      ? Marker(
                          markerId: MarkerId("startPosition"),
                          position:
                              LatLng(currentLocation.lat, currentLocation.lng),
                          icon: BitmapDescriptor.defaultMarkerWithHue(
                              BitmapDescriptor.hueBlue),
                          infoWindow: InfoWindow(
                            title: 'My Location',
                          ),
                        )
                      : Marker(
                          markerId: MarkerId("startPosition"),
                          position:
                              LatLng(currentLocation.lat, currentLocation.lng),
                          icon: context
                              .read<AppCubit>()
                              .state
                              .currentLocationIcon!,
                          infoWindow: InfoWindow(
                            title: 'My Location',
                          ),
                        ),
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
                initialChildSize: 0.4, // 35% của màn hình
                minChildSize: 0.2, // Chiều cao nhỏ nhất là 30%
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
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
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
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                          'Đi tới',
                                          style: AppTextStyle.blackS18Bold,
                                        ),
                                      ),
                                      Expanded(
                                        flex: 5,
                                        child: Text(
                                          context.read<AppCubit>().state.destinationAdress,
                                          style: AppTextStyle.blackS16Bold.copyWith(color: AppColors.primary),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                          'Khoảng cách',
                                          style: AppTextStyle.blackS14.copyWith(color: AppColors.gray),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 5,
                                        child: Text(
                                          "${int.parse(_cubit.rideProcessArgument.requestRide.distance) / 1000}km",
                                          style: AppTextStyle.blackS14Bold.copyWith(color: AppColors.gray),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    "Khách hàng",
                                    style: AppTextStyle.blackS18Bold,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                                    child: Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8.0),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 1,
                                            blurRadius: 5,
                                            offset: Offset(0, 3),
                                          ),
                                        ],
                                        color: AppColor.white,
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Image.asset(
                                                AppImages.icAvatar,
                                                height: 35,
                                              ),
                                              SizedBox(width: 10),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    _cubit.rideProcessArgument.customer_name,
                                                    style: AppTextStyle.blackS16Bold,
                                                  ),
                                                  Text(
                                                    _cubit.rideProcessArgument.customer_phone_num,
                                                    style: AppTextStyle.blackS14.copyWith(color: AppColors.gray),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          InkWell(
                                            onTap: ()=> launchUrlString("tel://${_cubit.rideProcessArgument.customer_phone_num}"),
                                            child: Image.asset(
                                              AppImages.icPhone,
                                              height: 30,
                                              color: AppColor.primary,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  if (context.read<AppCubit>().state.appStatus == AppStatus.pickuped) ...[
                                    Mainbutton(
                                      text: "Hoàn thành chuyến",
                                      type: 1,
                                      onTap: () {
                                        context.read<AppCubit>().publishMessage(
                                          "ride/${_cubit.rideProcessArgument.ride_id}/action",
                                          jsonEncode(
                                            RideActionRes(
                                              id: generateRandomCode(),
                                              publisher: 'driver',
                                              action: 'completed',
                                            ).toJson(),
                                          ),
                                        );
                                        AppSnackbar.showInfo(title: "Thông báo", message: "Gửi thông báo thành công, đợi khách hàng xác nhận");
                                      },
                                    )
                                  ],
                                  if (context.read<AppCubit>().state.appStatus == AppStatus.inProcess) ...[
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Mainbutton(
                                            text: "Huỷ",
                                            type: 0,
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
                                                                  onTap: () {
                                                                    context.read<AppCubit>().updateAppStatus(AppStatus.free);
                                                                    _cubit.cancelRide(commentController.text);
                                                                    context.read<AppCubit>().publishMessage(
                                                                      "ride/${_cubit.rideProcessArgument.ride_id}/action",
                                                                      jsonEncode(
                                                                        RideActionRes(
                                                                          id: generateRandomCode(),
                                                                          publisher: 'driver',
                                                                          action: 'cancel',
                                                                        ).toJson(),
                                                                      ),
                                                                    );
                                                                    context.read<AppCubit>().unsubscribeFromTopic(
                                                                      "ride/${_cubit.rideProcessArgument.ride_id}/action",
                                                                    );
                                                                    context.read<AppCubit>().timer!.cancel();
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
                                              // AppDialog.showConfirmDialog(text: "Bạn có chắc chắn muốn huỷ chuyến xe",onConfirm: (){
                                              //   context.read<AppCubit>().updateAppStatus(AppStatus.free);
                                              //   _cubit.cancelRide();
                                              //   context.read<AppCubit>().publishMessage(
                                              //     "ride/${_cubit.rideProcessArgument.ride_id}/action",
                                              //     jsonEncode(
                                              //       RideActionRes(
                                              //         id: generateRandomCode(),
                                              //         publisher: 'driver',
                                              //         action: 'cancel',
                                              //       ).toJson(),
                                              //     ),
                                              //   );
                                              //   context.read<AppCubit>().unsubscribeFromTopic(
                                              //     "ride/${_cubit.rideProcessArgument.ride_id}/action",
                                              //   );
                                              //   context.read<AppCubit>().timer!.cancel();
                                              // });
                                            },
                                          ),
                                        ),
                                        Expanded(
                                          child: Mainbutton(
                                            text: "Đã đón",
                                            type: 1,
                                            onTap: () async {
                                              context.read<AppCubit>().publishMessage(
                                                "ride/${_cubit.rideProcessArgument.ride_id}/action",
                                                jsonEncode(
                                                  RideActionRes(
                                                    id: generateRandomCode(),
                                                    publisher: 'driver',
                                                    action: 'arrived',
                                                  ).toJson(),
                                                ),
                                              );
                                              // context.read<AppCubit>().updateDestination(
                                              //   Location(
                                              //     lat: double.parse(_cubit.rideProcessArgument.requestRide.dropoffLat),
                                              //     lng: double.parse(_cubit.rideProcessArgument.requestRide.dropoffLng),
                                              //   ),
                                              // );
                                              AppSnackbar.showInfo(
                                                title: "Thông báo",
                                                message: "Đợi khách hàng xác nhận",
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    )
                                  ]
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
