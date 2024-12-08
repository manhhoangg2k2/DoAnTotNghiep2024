import 'package:fare_riding_app/models/response/fare/ride_history_res.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../constant/AppColor.dart';
import '../../../../../router/route_config.dart';
import '../../../../common/MainButton.dart';
import '../../../../common/app_colors.dart';
import '../../../../common/app_divider.dart';
import '../../../../common/app_images.dart';
import '../../../../common/app_text_styles.dart';

class CancelRideWidget2 extends StatelessWidget {
  CancelRideWidget2({super.key});

  @override
  Widget build(BuildContext context) {
    final RideHistoryRes rideHistoryRes = ModalRoute.of(context)?.settings.arguments as RideHistoryRes;
    return Scaffold(
      backgroundColor: AppColors.textLight,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Chuyến xe đã bị huỷ", style: AppTextStyle.blackS20Bold.copyWith(color: AppColors.primary),),
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
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Tài xế",
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
              // Align(
              //     alignment: Alignment.centerLeft,
              //     child: Text(
              //       "Phương tiện",
              //       style: AppTextStyle.blackS16Bold.copyWith(),
              //     )),
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              //   child: Container(
              //     padding: EdgeInsets.all(10),
              //     decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(8.0),
              //         boxShadow: [
              //           BoxShadow(
              //             color: Colors.grey.withOpacity(0.5),
              //             spreadRadius: 1,
              //             blurRadius: 5,
              //             offset: Offset(0, 3), // changes position of shadow
              //           ),
              //         ],
              //         color: AppColor.white),
              //     child: Column(
              //       children: [
              //         Row(
              //           children: [
              //             SvgPicture.asset(
              //               AppImages.icMotorbike,
              //               height: 35,
              //             ),
              //             SizedBox(
              //               width: 10,
              //             ),
              //             Column(
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //                 Text(
              //                   rideHistoryRes.driver!.,
              //                   style: AppTextStyle.blackS14Bold,
              //                 ),
              //                 Text(
              //                   "${rideRes.driver!.vehicle!.description!} - ${rideRes.driver!.vehicle!.code!}",
              //                   style: AppTextStyle.blackS12
              //                       .copyWith(color: AppColors.gray),
              //                 ),
              //               ],
              //             ),
              //           ],
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              Row(
                children: [
                  Text(
                    "Người huỷ",
                    style: AppTextStyle.blackS16Bold.copyWith(),
                  ),
                  Text(
                    "Tài xế",
                    style: AppTextStyle.blackS16Bold.copyWith(),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Lý do huỷ",
                    style: AppTextStyle.blackS16Bold.copyWith(),
                  )),
              SizedBox(height: 10,),
              Text(
                '"${rideHistoryRes.note}"',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 16,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              Mainbutton(text: "Trở về trang chủ", type: 1, onTap: (){
                Get.toNamed(RouteConfig.main);
              })
            ],
          ),
        ),
      ),
    );
  }
}
