import 'package:fare_riding_app/blocs/app_cubit.dart';
import 'package:fare_riding_app/models/response/user/user_info_res.dart';
import 'package:fare_riding_app/ui/common/AppBar.dart';
import 'package:fare_riding_app/ui/common/app_colors.dart';
import 'package:fare_riding_app/ui/common/app_divider.dart';
import 'package:fare_riding_app/ui/common/app_function.dart';
import 'package:fare_riding_app/ui/pages/Home/cubit/home_cubit.dart';
import 'package:fare_riding_app/ui/pages/Home/widget/request_ride/request_ride_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../constant/AppColor.dart';
import '../../../common/app_text_styles.dart';

class HomeScreen1 extends StatelessWidget {
  const HomeScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => HomeCubit()..Init(),
      child: _HomeScreen1(),
    );
  }
}

class _HomeScreen1 extends StatefulWidget {
  const _HomeScreen1({super.key});

  @override
  State<_HomeScreen1> createState() => _HomeScreen1State();
}

class _HomeScreen1State extends State<_HomeScreen1> {
  late HomeCubit _cubit;
  late UserInfoRes userInfo;

  @override
  void initState() {
    super.initState();
    _cubit = context.read<HomeCubit>();
    userInfo = context.read<AppCubit>().state.userInfo!;
    context.read<AppCubit>().subscribeToTopic('driver/123123');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.textLight.withOpacity(0.96),
      appBar: AppBarBase(text: "Màn hình chính",),
      body: BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
        // if (state.requestRidesRes == null || state.requestRidesRes!.listRequestRide.isEmpty) {
        //   return Center(
        //     child: CircularProgressIndicator(),
        //   );
        // } else {
        return Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${userInfo.name}"),
                  Switch(
                    value: context.read<AppCubit>().state.isActive,
                    onChanged: (value) {
                      context.read<AppCubit>().switchActive(value);
                    },
                    activeColor: AppColors.primary,
                  ),
                ],
              ),
              SizedBox(height: 20,),
              if (state.requestRidesRes != null) ...[
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => RequestRideDetail(requestRide: _cubit.state.requestRidesRes!.listRequestRide[index]),
                          ));
                        },
                        child: Container(
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
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                SvgPicture.asset(
                                                  'assets/svg/map_red.svg',
                                                  height: 25,
                                                ),
                                                SizedBox(width: 8),
                                                Expanded(
                                                  child: Text(
                                                    _cubit.state.requestRidesRes!.listRequestRide[index].pickupAddress,
                                                    style: AppTextStyle.description,
                                                    maxLines: 2,
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 10,),
                                            // Padding(padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5), child: SolidAppDivider(),),
                                            Row(
                                              children: [
                                                SvgPicture.asset(
                                                  'assets/svg/map_green.svg',
                                                  height: 25,
                                                  color: AppColor.primary,
                                                ),
                                                SizedBox(width: 8),
                                                Expanded(
                                                  child: Text(
                                                    _cubit.state.requestRidesRes!.listRequestRide[index].dropoffAddress,
                                                    style: AppTextStyle.description,
                                                    maxLines: 2,
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 15), // Thêm khoảng cách ngang giữa Column và SvgPicture
                                      SvgPicture.asset(
                                        'assets/svg/right_arrow.svg',
                                        height: 25,
                                        color: AppColor.primary,
                                      ),
                                    ],
                                  ),
                                  Padding(padding: EdgeInsets.symmetric(vertical: 10), child: DashedAppDivider(),),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Tổng tiền", style: AppTextStyle.blackS16Bold,),
                                      Text("${formatCurrency(double.parse(_cubit.state.requestRidesRes!.listRequestRide[index].finalPrice)) }đ", style: AppTextStyle.blackS18Bold.copyWith(color: AppColors.primary),)
                                    ],
                                  )
                                ],
                              ),),
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(height: 10,),
                    itemCount:
                        _cubit.state.requestRidesRes!.listRequestRide.length,
                  ),
                )
              ]
            ],
          ),
        );
      }
          // },
          ),
    );
  }
}
