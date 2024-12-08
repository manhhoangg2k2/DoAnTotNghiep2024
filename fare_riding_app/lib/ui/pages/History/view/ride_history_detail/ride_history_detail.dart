import 'package:fare_riding_app/models/response/fare/ride_history_res.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

import '../../../../../constant/AppColor.dart';
import '../../../../common/MainButton.dart';
import '../../../../common/app_colors.dart';
import '../../../../common/app_divider.dart';
import '../../../../common/app_function.dart';
import '../../../../common/app_images.dart';
import '../../../../common/app_text_styles.dart';

class RideHistoryDetail extends StatelessWidget {
  const RideHistoryDetail({super.key, required this.rideHistoryRes});

  final RideHistoryRes rideHistoryRes;

  @override
  Widget build(BuildContext context) {

    String calculateDuration(String startTimestamp, String endTimestamp) {
      try {
        DateTime startTime = DateTime.parse(startTimestamp);
        DateTime endTime = DateTime.parse(endTimestamp);

        Duration duration = endTime.difference(startTime);

        int hours = duration.inHours;
        int minutes = duration.inMinutes.remainder(60);
        print(hours);
        print(minutes);
        if (hours > 0 && minutes > 0) {
          return "$hours giờ $minutes phút";
        } else if (hours > 0) {
          return "$hours giờ";
        } else {
          return "$minutes phút";
        }
      } catch (e) {
        return "Thời gian không hợp lệ";
      }
    }
    return Scaffold(
      backgroundColor: AppColors.textLight,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Chuyến xe hoàn thành", style: AppTextStyle.blackS20Bold.copyWith(color: AppColors.primary),),
              Image.asset(AppImages.icError),
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
                          height: 20,
                        ),
                      ),
                      Expanded(
                        flex: 7,
                        child: Text(
                          rideHistoryRes.pickupLocation!,
                          style: AppTextStyle.description.copyWith(fontSize: 12),
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
                          rideHistoryRes.dropoffLocation!,
                          style: AppTextStyle.description.copyWith(fontSize: 12),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SolidAppDivider(),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tổng tiền',
                        style: AppTextStyle.blackS16Bold
                            .copyWith(fontSize: 20),
                      ),
                      Text(
                        '${formatCurrency(double.parse(rideHistoryRes.fare))}đ',
                        style: AppTextStyle.blackS16Bold.copyWith(
                            fontSize: 20, color: AppColor.primary),
                      )
                    ],
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Text(
                  //       'Khoảng cách',
                  //       style: AppTextStyle.blackS16,
                  //     ),
                  //     Text(
                  //       '${double.parse(rideHistoryRes.) / 1000} km',
                  //       style: AppTextStyle.blackS16,
                  //     )
                  //   ],
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Thời gian chuyến xe',
                        style: AppTextStyle.blackS16,
                      ),
                      Text(
                        '${calculateDuration(rideHistoryRes.pickupTime!, rideHistoryRes.dropoffTime!)}',
                        style: AppTextStyle.blackS16,
                      )
                    ],
                  ),
                ],
              ),
              SolidAppDivider(),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Khách hàng",
                    style: AppTextStyle.blackS16Bold.copyWith(),
                  )),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Container(
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
                      color: AppColor.white),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    rideHistoryRes.driver.name,
                                    style: AppTextStyle.blackS16Bold,
                                  ),
                                  Text(
                                    rideHistoryRes.driver.phoneNumber,
                                    style: AppTextStyle.blackS14
                                        .copyWith(color: AppColors.gray),
                                  ),
                                  // Text(
                                  //   widget.rideRes.driver!.vehicleId,
                                  //   style: AppTextStyle.blackS14
                                  //       .copyWith(color: AppColors.gray),
                                  // ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Mainbutton(text: "Quay lại", type: 1, onTap: (){
                Get.back();
              })
            ],
          ),
        ),
      ),
    );
  }
}
