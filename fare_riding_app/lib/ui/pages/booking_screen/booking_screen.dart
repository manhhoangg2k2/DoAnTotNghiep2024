import 'package:fare_riding_app/blocs/app_cubit.dart';
import 'package:fare_riding_app/constant/AppColor.dart';
import 'package:fare_riding_app/models/response/fare/calculation_res.dart';
import 'package:fare_riding_app/ui/common/MainButton.dart';
import 'package:fare_riding_app/ui/common/app_divider.dart';
import 'package:fare_riding_app/ui/common/app_function.dart';
import 'package:fare_riding_app/ui/common/app_images.dart';
import 'package:fare_riding_app/ui/common/app_text_styles.dart';
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
  const BookingScreen(
      {super.key,});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BookingCubit>(
      create: (context) => BookingCubit(),
      child: _BookingScreen(),
    );
  }
}

class _BookingScreen extends StatefulWidget {
  const _BookingScreen(
      {super.key,});

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
    latLngList = _cubit.state.rideEntity!.calculationRes!.coordinates.map<LatLng>((coordinate) {
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
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: CameraPosition(
              target: LatLng(_cubit.state.rideEntity!.calculationRes!.coordinates.first.lat,
                  _cubit.state.rideEntity!.calculationRes!.coordinates.first.lng),
              zoom: 14.0,
            ),
            polylines: _polyline,
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            onMapCreated: (GoogleMapController controller) {
              // _controller = controller;
            },
            circles: {
              Circle(
                circleId: CircleId("currentLocationCircle"),
                center: LatLng(_cubit.state.rideEntity!.calculationRes!.pickupLocation.lat,
                    _cubit.state.rideEntity!.calculationRes!.pickupLocation.lng),
                radius: 1000, // Radius in meters
                fillColor:
                    Colors.blue.withOpacity(0.2), // Blue color with opacity 0.2
                strokeColor: Colors.blue, // Blue stroke color
                strokeWidth: 2, // Stroke width
              ),
            },
            markers: {
              Marker(
                markerId: MarkerId("startPosition"),
                position: LatLng(_cubit.state.rideEntity!.calculationRes!.pickupLocation.lat,
                    _cubit.state.rideEntity!.calculationRes!.pickupLocation.lng),
                icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueBlue),
                infoWindow: InfoWindow(
                  title: 'My Location',
                ),
              ),
              Marker(
                markerId: MarkerId("endPosition"),
                position: LatLng(_cubit.state.rideEntity!.calculationRes!.dropoffLocation.lat,
                    _cubit.state.rideEntity!.calculationRes!.dropoffLocation.lng),
                icon: BitmapDescriptor.defaultMarker,
                infoWindow: InfoWindow(
                  title: 'Destination',
                ),
              ),
            },
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.53, // 50% của màn hình
            minChildSize: 0.4, // Chiều cao nhỏ nhất là 50%
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
                                        _cubit.state.rideEntity!.pickupLocation!,
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
                                        _cubit.state.rideEntity!.dropoffLocation!,
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
                              titleBottomSheet: "Chọn phương thức thanh toán",
                              bodyBottomSheet: Container(),
                            ),
                            SizedBox(height: 10,),
                            _buildSelectOption(
                              leadingIcon: AppImages.icCoupon2,
                              label: 'Giảm giá',
                              titleBottomSheet: "Chọn mã giảm giá",
                              bodyBottomSheet: BlocBuilder<BookingCubit, BookingState>(
                                builder: (context, state) {
                                  if (state.listCoupon == null) {
                                    return Center(child: CircularProgressIndicator());
                                  } else if (state.listCoupon!.coupons.isEmpty) {
                                    return Center(child: Text('Không có mã giảm giá'));
                                  }
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                                    child: Column(
                                      children: [
                                        Expanded(
                                          child: ListView.separated(
                                            itemBuilder: (context, index) {
                                              return Container(
                                                child: InkWell(
                                                  onTap: (){
                                                    if(index == state.couponChooseIndex){
                                                      _cubit.setCouponChooseIndex(-1);
                                                    }
                                                    else _cubit.setCouponChooseIndex(index);
                                                  },
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                    children: [
                                                      Image.asset(AppImages.icAvatar, height: 50,),
                                                      Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text(state.listCoupon!.coupons[index].code.toString(), style: AppTextStyle.blackS16Bold,),
                                                          Text(state.listCoupon!.coupons[index].description),
                                                          Text("Hết hạn: ${state.listCoupon!.coupons[index].expiredDate.toString()}"),
                                                        ],
                                                      ),
                                                      Container(height: 20, width: 20, decoration: BoxDecoration(color: state.couponChooseIndex == index ? AppColors.primary : AppColors.textLight,borderRadius: BorderRadius.circular(50), border: Border.all(color: AppColors.gray)),)
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                            separatorBuilder: (context, index) {
                                              return Divider();
                                            },
                                            itemCount: state.listCoupon!.coupons.length,
                                          ),
                                        ),
                                        Mainbutton(text: 'Xác nhận', type: 1, onTap: (){
                                          Get.back();
                                          _cubit.getBookingCalculation();
                                        })
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                            SolidAppDivider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Thanh toán',
                                  style: AppTextStyle.blackS16Bold
                                      .copyWith(fontSize: 20),
                                ),
                                Text(
                                  '${formatCurrency(_cubit.state.rideEntity!.calculationRes!.finalPrice.toDouble())}đ',
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
                                  '${_cubit.state.rideEntity!.calculationRes!.distance / 1000} km',
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
                                  '${_cubit.state.rideEntity!.calculationRes!.duration} phút',
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
                            Mainbutton(text: 'Đặt xe', type: 1, onTap: (){
                              _cubit.requestRide(_cubit.state.rideEntity!.calculationRes!, 'cash',);
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

