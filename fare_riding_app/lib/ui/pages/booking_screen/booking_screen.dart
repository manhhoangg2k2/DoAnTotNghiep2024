import 'package:fare_riding_app/blocs/app_cubit.dart';
import 'package:fare_riding_app/constant/AppColor.dart';
import 'package:fare_riding_app/models/enums/app_status.dart';
import 'package:fare_riding_app/models/response/fare/calculation_res.dart';
import 'package:fare_riding_app/ui/common/MainButton.dart';
import 'package:fare_riding_app/ui/common/app_divider.dart';
import 'package:fare_riding_app/ui/common/app_function.dart';
import 'package:fare_riding_app/ui/common/app_images.dart';
import 'package:fare_riding_app/ui/common/app_loading.dart';
import 'package:fare_riding_app/ui/common/app_snackbar.dart';
import 'package:fare_riding_app/ui/common/app_text_styles.dart';
import 'package:fare_riding_app/ui/common/floating_action_button.dart';
import 'package:fare_riding_app/ui/pages/booking_screen/booking_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../common/app_bottom_sheet.dart';
import '../../common/app_colors.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BookingCubit>(
      create: (context) => BookingCubit(),
      child: _BookingScreen(),
    );
  }
}

class _BookingScreen extends StatefulWidget {
  const _BookingScreen({
    super.key,
  });

  @override
  State<_BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<_BookingScreen> {
  late BookingCubit _cubit;

  late List<LatLng> latLngList;

  Set<Polyline> _polyline = {};

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    _cubit = context.read<BookingCubit>();
    _cubit.Init();
  }

  @override
  void initState() {
    _cubit = context.read<BookingCubit>();
    _cubit.Init();
    latLngList = _cubit.rideEntity!.calculationRes![0].coordinates
        .map<LatLng>((coordinate) {
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
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              GoogleMap(
                mapType: MapType.terrain,
                initialCameraPosition: CameraPosition(
                  target: LatLng(
                      _cubit.rideEntity.calculationRes![_cubit.state.routeIndex].coordinates.first
                          .lat,
                      _cubit.rideEntity.calculationRes![_cubit.state.routeIndex].coordinates.first
                          .lng),
                  zoom: 14.0,
                ),
                polylines: _cubit.state.polyline ?? {},
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                onMapCreated: (GoogleMapController controller) {
                  // _controller = controller;
                },
                circles: {
                  Circle(
                    circleId: CircleId("currentLocationCircle"),
                    center: LatLng(
                        _cubit.rideEntity.calculationRes![_cubit.state.routeIndex].pickupLocation
                            .lat,
                        _cubit.rideEntity.calculationRes![_cubit.state.routeIndex].pickupLocation
                            .lng),
                    radius: 1500, // Radius in meters
                    fillColor: Colors.blue
                        .withOpacity(0.2), // Blue color with opacity 0.2
                    strokeColor: Colors.blue, // Blue stroke color
                    strokeWidth: 2, // Stroke width
                  ),
                },
                markers: {
                  Marker(
                    markerId: MarkerId("startPosition"),
                    position: LatLng(
                        _cubit.rideEntity!.calculationRes![_cubit.state.routeIndex].pickupLocation
                            .lat,
                        _cubit.rideEntity!.calculationRes![_cubit.state.routeIndex].pickupLocation
                            .lng),
                    icon: BitmapDescriptor.defaultMarkerWithHue(
                        BitmapDescriptor.hueBlue),
                    infoWindow: InfoWindow(
                      title: 'My Location',
                    ),
                  ),
                  Marker(
                    markerId: MarkerId("endPosition"),
                    position: LatLng(
                        _cubit.rideEntity!.calculationRes![_cubit.state.routeIndex].dropoffLocation
                            .lat,
                        _cubit.rideEntity!.calculationRes![_cubit.state.routeIndex].dropoffLocation
                            .lng),
                    icon: BitmapDescriptor.defaultMarker,
                    infoWindow: InfoWindow(
                      title: 'Destination',
                    ),
                  ),
                },
              ),
              LeftBackButton(),
              DraggableScrollableSheet(
                initialChildSize: 0.55,
                minChildSize: 0.2,
                maxChildSize: 0.8,
                builder:
                    (BuildContext context, ScrollController scrollController) {
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
                                            _cubit.rideEntity!
                                                .pickupLocation!,
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
                                            _cubit.rideEntity!
                                                .dropoffLocation!,
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
                                _buildSelectOption(
                                  leadingIcon: AppImages.icBuyRates,
                                  label: 'Tiền mặt',
                                  titleBottomSheet:
                                      "Chọn phương thức thanh toán",
                                  bodyBottomSheet:
                                  BlocBuilder<BookingCubit, BookingState>(
                                    builder: (context, state) {
                                      // Kiểm tra trạng thái nếu cần (trường hợp này không cần vì chỉ có 2 phần tử tĩnh)
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            // Tùy chọn "Tiền mặt"
                                            Column(
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    _cubit.setPaymentMethodIndex(0); // Index cho "Tiền mặt"
                                                  },
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text(
                                                        'Tiền mặt',
                                                        style: AppTextStyle.blackS16Bold,
                                                      ),
                                                      Container(
                                                        height: 20,
                                                        width: 20,
                                                        decoration: BoxDecoration(
                                                          color: state.paymentMethodIndex == 0
                                                              ? AppColors.primary
                                                              : AppColors.textLight,
                                                          borderRadius: BorderRadius.circular(50),
                                                          border: Border.all(color: AppColors.gray),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const Divider(),

                                                // Tùy chọn "Thanh toán qua tài khoản ví"
                                                InkWell(
                                                  onTap: () {
                                                    if(context.read<AppCubit>().state.userInfo!.balance < _cubit.rideEntity.calculationRes![_cubit.state.routeIndex].finalPrice){
                                                      AppSnackbar.showError(title: "Thông báo", message: "Bạn khng còn đủ tiền trong tài khoản");
                                                    }
                                                    else _cubit.setPaymentMethodIndex(1);
                                                  },
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text(
                                                        'Thanh toán qua tài khoản ví',
                                                        style: AppTextStyle.blackS16Bold,
                                                      ),
                                                      Container(
                                                        height: 20,
                                                        width: 20,
                                                        decoration: BoxDecoration(
                                                          color: state.paymentMethodIndex == 1
                                                              ? AppColors.primary
                                                              : AppColors.textLight,
                                                          borderRadius: BorderRadius.circular(50),
                                                          border: Border.all(color: AppColors.gray),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            // Nút xác nhận
                                            Mainbutton(
                                              text: 'Xác nhận',
                                              type: 1,
                                                onTap: () {
                                                  Get.back();
                                                  _cubit
                                                      .getBookingCalculation();
                                                }
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  )
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                _buildSelectOption(
                                  leadingIcon: AppImages.icCoupon2,
                                  label: 'Giảm giá',
                                  titleBottomSheet: "Chọn mã giảm giá",
                                  bodyBottomSheet:
                                      BlocBuilder<BookingCubit, BookingState>(
                                    builder: (context, state) {
                                      if (state.listCoupon == null) {
                                        return Center(
                                            child: CircularProgressIndicator());
                                      } else if (state
                                          .listCoupon!.coupons.isEmpty) {
                                        return Center(
                                            child:
                                                Text('Không có mã giảm giá'));
                                      }
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 20),
                                        child: Column(
                                          children: [
                                            Expanded(
                                              child: ListView.separated(
                                                itemBuilder: (context, index) {
                                                  return Container(
                                                    child: InkWell(
                                                      onTap: () {
                                                        if (index ==
                                                            state
                                                                .couponChooseIndex) {
                                                          _cubit
                                                              .setCouponChooseIndex(
                                                                  -1);
                                                        } else
                                                          _cubit
                                                              .setCouponChooseIndex(
                                                                  index);
                                                      },
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          Image.asset(
                                                            AppImages.icAvatar,
                                                            height: 50,
                                                          ),
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                state
                                                                    .listCoupon!
                                                                    .coupons[
                                                                        index]
                                                                    .code
                                                                    .toString(),
                                                                style: AppTextStyle
                                                                    .blackS16Bold,
                                                              ),
                                                              Text(state
                                                                  .listCoupon!
                                                                  .coupons[
                                                                      index]
                                                                  .description),
                                                              Text(
                                                                  "Hết hạn: ${state.listCoupon!.coupons[index].expiredDate.toString()}"),
                                                            ],
                                                          ),
                                                          Container(
                                                            height: 20,
                                                            width: 20,
                                                            decoration: BoxDecoration(
                                                                color: state.couponChooseIndex ==
                                                                        index
                                                                    ? AppColors
                                                                        .primary
                                                                    : AppColors
                                                                        .textLight,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            50),
                                                                border: Border.all(
                                                                    color: AppColors
                                                                        .gray)),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                                separatorBuilder:
                                                    (context, index) {
                                                  return Divider();
                                                },
                                                itemCount: state
                                                    .listCoupon!.coupons.length,
                                              ),
                                            ),
                                            Mainbutton(
                                                text: 'Xác nhận',
                                                type: 1,
                                                onTap: () {
                                                  Get.back();
                                                  _cubit
                                                      .getBookingCalculation();
                                                })
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                SizedBox(height: 10,),
                                _buildSelectOption(
                                  leadingIcon: AppImages.icCoupon2,
                                  label: 'Chọn tuyến đường',
                                  titleBottomSheet: "Chọn tuyến đường",
                                  bodyBottomSheet:
                                  BlocBuilder<BookingCubit, BookingState>(
                                    builder: (context, state) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 20),
                                        child: Column(
                                          children: [
                                            Expanded(
                                              child: ListView.separated(
                                                itemBuilder: (context, index) {
                                                  return Container(
                                                    child: InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          if(context.read<AppCubit>().state.userInfo!.balance < _cubit.rideEntity.calculationRes![index].finalPrice && _cubit.state.paymentMethodIndex == 1){
                                                            AppSnackbar.showError(title: "Thông báo", message: "Bạn khng còn đủ tiền trong tài khoản");
                                                          }
                                                          else{
                                                            _cubit
                                                                .setRouteIndex(
                                                                index);
                                                            _cubit.updatePolyline(index);
                                                          }
                                                        });
                                                      },
                                                      child: Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                        children: [
                                                          Image.asset(
                                                            AppImages.icAvatar,
                                                            height: 50,
                                                          ),
                                                          Column(
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                            children: [
                                                              Text("Tuyến đường ${index+1}", style: AppTextStyle
                                                                  .blackS16Bold,),
                                                              Text("Giá: ${state.rideEntity!.calculationRes![index].finalPrice}đ", style: AppTextStyle
                                                                  .blackS14Bold.copyWith(color: AppColor.primary),),
                                                              Text("Khoảng cách: ${state.rideEntity!.calculationRes![index].distance/1000}km"),
                                                              Text("Thời gian ước tính: ${state.rideEntity!.calculationRes![index].duration} phút"),
                                                            ],
                                                          ),
                                                          Container(
                                                            height: 20,
                                                            width: 20,
                                                            decoration: BoxDecoration(
                                                                color: state.routeIndex ==
                                                                    index
                                                                    ? AppColors
                                                                    .primary
                                                                    : AppColors
                                                                    .textLight,
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    50),
                                                                border: Border.all(
                                                                    color: AppColors
                                                                        .gray)),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                                separatorBuilder:
                                                    (context, index) {
                                                  return Divider();
                                                },
                                                itemCount: state
                                                    .rideEntity!.calculationRes!.length,
                                              ),
                                            ),
                                            Mainbutton(
                                                text: 'Xác nhận',
                                                type: 1,
                                                onTap: () {
                                                  Get.back();
                                                  _cubit
                                                      .getBookingCalculation();
                                                })
                                          ],
                                        ),
                                      );
                                    },
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
                                      '${formatCurrency(_cubit.rideEntity!.calculationRes![_cubit.state.routeIndex].finalPrice.toDouble())}đ',
                                      style: AppTextStyle.blackS16Bold.copyWith(
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
                                      '${_cubit.rideEntity!.calculationRes![_cubit.state.routeIndex].distance / 1000} km',
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
                                      '${_cubit.rideEntity!.calculationRes![_cubit.state.routeIndex].duration} phút',
                                      style: AppTextStyle.blackS16,
                                    )
                                  ],
                                ),
                                SolidAppDivider(),

                                context.read<AppCubit>().state.appStatus == AppStatus.inRequest ? ErrorButton(text: "Huỷ", onTap: (){
                                  AppLoadingIndicator.show(context);
                                  context
                                      .read<AppCubit>()
                                      .updateAppStatus(AppStatus.free);
                                  _cubit.cancelRequestRide(context
                                      .read<AppCubit>().state.userInfo!.id.toString());
                                  AppLoadingIndicator.hide();
                                }) :
                                Mainbutton(
                                    text: 'Đặt xe',
                                    type: 1,
                                    onTap: () async {
                                      AppLoadingIndicator.show(context);
                                      await _cubit.requestRide(
                                        _cubit
                                            .state.rideEntity!.calculationRes![_cubit.state.routeIndex],
                                        _cubit
                                            .state.paymentMethodIndex ==0 ? 'cash' : 'wallet',
                                      );
                                      context
                                          .read<AppCubit>()
                                          .subscribeToRequestRideTopic(context
                                              .read<AppCubit>()
                                              .state
                                              .userInfo!
                                              .id
                                              .toString());
                                      context
                                          .read<AppCubit>()
                                          .updateAppStatus(AppStatus.inRequest);
                                      AppLoadingIndicator.hide();
                                      // AppSnackbar.showInfo(message: "Đặt xe ")
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
      },
    );
  }

  _buildSelectOption({
    required String leadingIcon,
    String? label,
    required String titleBottomSheet,
    required Widget bodyBottomSheet,
    String? description,
    Widget? labelWidget,
  }) {
    return InkWell(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
        AppBottomSheet.showBottomSheet(
            title: titleBottomSheet,
            body: BlocProvider.value(
              value: context.read<BookingCubit>(),
              child: bodyBottomSheet,
            ));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
            color: AppColors.backgroundNormal,
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            // Image.asset(
            //   leadingIcon,
            //   height: 24,
            //   width: 24,
            //   color: AppColors.gray,
            // ),
            SizedBox(width: 10),
            Expanded(
              child: labelWidget ??
                  Text(
                    label ?? '',
                    style: AppTextStyle.title,
                  ),
            ),
            description != null
                ? Text(description,
                    style: AppTextStyle.description
                        .copyWith(color: AppColors.textGrey))
                : const SizedBox(),
            SizedBox(width: 4),
            Image.asset(
              AppImages.icArrowRightSmall,
              height: 24,
              width: 24,
              color: AppColors.gray,
            ),
          ],
        ),
      ),
    );
  }
}

class Example extends StatefulWidget {
  const Example({super.key});

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

