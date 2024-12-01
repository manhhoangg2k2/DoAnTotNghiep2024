import 'package:fare_riding_app/models/response/fare/ride_res.dart';
import 'package:fare_riding_app/ui/common/MainButton.dart';
import 'package:fare_riding_app/ui/common/MainTextField.dart';
import 'package:fare_riding_app/ui/common/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../constant/AppColor.dart';
import '../../../common/app_colors.dart';
import '../../../common/app_divider.dart';
import '../../../common/app_function.dart';
import '../../../common/app_text_styles.dart';
import '../ride_process_cubit.dart';

class CompletedRideScreen extends StatelessWidget {
  const CompletedRideScreen({super.key, required this.rideRes});

  final RideRes rideRes;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RideProcessCubit>(
      create: (BuildContext context) => RideProcessCubit(),
      child: _CompletedRideScreen(
        rideRes: rideRes,
      ),
    );
  }
}

class _CompletedRideScreen extends StatefulWidget {
  const _CompletedRideScreen({super.key, required this.rideRes});

  final RideRes rideRes;

  @override
  State<_CompletedRideScreen> createState() => _CompletedRideScreenState();
}

class _CompletedRideScreenState extends State<_CompletedRideScreen> {
  TextEditingController commentController = TextEditingController();
  double _rating = 5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.textLight,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Bạn đã hoàn thành chuyến xe", style: AppTextStyle.blackS20Bold.copyWith(color: AppColors.primary),),
              SvgPicture.asset(AppImages.success),
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
                          widget.rideRes.ride!.pickupAddress!,
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
                          widget.rideRes.ride!.dropoffAddress!,
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
                                    widget.rideRes.driver!.name!,
                                    style: AppTextStyle.blackS16Bold,
                                  ),
                                  Text(
                                    widget.rideRes.driver!.phoneNumber!,
                                    style: AppTextStyle.blackS14
                                        .copyWith(color: AppColors.gray),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Image.asset(
                            AppImages.icPhone,
                            height: 30,
                            color: AppColor.primary,
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
                        children: [
                          SvgPicture.asset(
                            AppImages.icMotorbike,
                            height: 35,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.rideRes.driver!.vehicle!.name!,
                                style: AppTextStyle.blackS14Bold,
                              ),
                              Text(
                                "${widget.rideRes.driver!.vehicle!.description!} - ${widget.rideRes.driver!.vehicle!.code!}",
                                style: AppTextStyle.blackS12
                                    .copyWith(color: AppColors.gray),
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Thanh toán',
                    style: AppTextStyle.blackS16Bold.copyWith(fontSize: 20),
                  ),
                  Text(
                    '${formatCurrency(double.parse(widget.rideRes.ride!.finalPrice!))}đ',
                    style: AppTextStyle.blackS16Bold
                        .copyWith(fontSize: 20, color: AppColor.primary),
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
                    '${double.parse(widget.rideRes.ride!.distance!) / 1000} km',
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
                    '${double.parse(widget.rideRes.ride!.duration!)} phút',
                    style: AppTextStyle.blackS16,
                  )
                ],
              ),
              Text("Đánh giá tài xế"),
              RatingBar.builder(
                initialRating: 5,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  _rating = rating;
                },
              ),
              MainTextField(controller: commentController, maxLines: 3, hint: "Đánh giá chuyến đi của bạn",),
              SizedBox(height: 10,),
              Mainbutton(text: "Đánh giá", type: 1, onTap: (){
              })
            ],
          ),
        ),
      ),
    );
  }
}
