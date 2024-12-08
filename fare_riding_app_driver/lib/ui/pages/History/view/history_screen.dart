import 'package:fare_riding_app/constant/AppColor.dart';
import 'package:fare_riding_app/models/enums/history_filter.dart';
import 'package:fare_riding_app/ui/common/AppBar.dart';
import 'package:fare_riding_app/ui/common/app_colors.dart';
import 'package:fare_riding_app/ui/common/app_loading.dart';
import 'package:fare_riding_app/ui/common/app_text_styles.dart';
import 'package:fare_riding_app/ui/pages/History/cubit/history_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../common/app_divider.dart';
import '../../../common/app_function.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HistoryCubit>(
      create: (context) => HistoryCubit()..Init(),
      child: _HistoryScreen(),
    );
  }
}

class _HistoryScreen extends StatefulWidget {
  const _HistoryScreen({super.key});

  @override
  State<_HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<_HistoryScreen> {
  late HistoryCubit _cubit;

  @override
  void initState() {
    _cubit = context.read<HistoryCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryCubit, HistoryState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColor.white,
          appBar: AppBarBase(
            title: "Lịch sử",
            showBackButton: false,
          ),
          body: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    for (var value in HistoryFilter.values) ...[
                      InkWell(
                        onTap: () async {
                          AppLoadingIndicator.show(context);
                          await _cubit.changeFilter(value);
                          AppLoadingIndicator.hide();
                        },
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          decoration: BoxDecoration(
                              color: _cubit.state.historyFilter == value
                                  ? AppColor.primary
                                  : AppColor.gray_EEE,
                              // border: Border.all(color: AppColor.black),
                              borderRadius: BorderRadius.circular(20)),
                          child: Text(
                            value.getLabel,
                            style: AppTextStyle.blackS16.copyWith(
                                color: _cubit.state.historyFilter == value
                                    ? AppColor.white
                                    : AppColor.black),
                          ),
                        ),
                      )
                    ]
                  ],
                ),
                _cubit.state.listRideHistory != [] ?
                Expanded(child: ListView.separated(
                  clipBehavior: Clip.none,
                    itemBuilder: (context, index){
                      return InkWell(
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => RequestRideDetail(
                          //           requestRide: _cubit
                          //               .state
                          //               .requestRidesRes!
                          //               .listRequestRide[index]),
                          //     ));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                              color: AppColor.white),
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          children: [
                                            SvgPicture.asset(
                                              'assets/svg/map_red.svg',
                                              height: 25,
                                            ),
                                            SizedBox(width: 8),
                                            Expanded(
                                              child: Text(
                                                _cubit
                                                    .state
                                                    .listRideHistory[index].pickupLocation == null ? "null" : _cubit.state.listRideHistory[index].pickupLocation!,
                                                style: AppTextStyle
                                                    .description,
                                                maxLines: 2,
                                                overflow:
                                                TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
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
                                                _cubit
                                                    .state
                                                    .listRideHistory[index].dropoffLocation == null ? "null" : _cubit.state.listRideHistory[index].dropoffLocation!,
                                                style: AppTextStyle
                                                    .description,
                                                maxLines: 2,
                                                overflow:
                                                TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                      width:
                                      15), // Thêm khoảng cách ngang giữa Column và SvgPicture
                                  SvgPicture.asset(
                                    'assets/svg/right_arrow.svg',
                                    height: 25,
                                    color: AppColor.primary,
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: DashedAppDivider(),
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Tổng tiền",
                                    style: AppTextStyle.blackS16Bold,
                                  ),
                                  Text(
                                    "${formatCurrency(double.parse(_cubit.state.listRideHistory[index].fare))}đ",
                                    style: AppTextStyle.blackS18Bold
                                        .copyWith(color: AppColors.primary),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(height: 10,),
                    itemCount: _cubit.state.listRideHistory.length))
                    :
              ],
            ),
          ),
        );
      },
    );
  }
}
