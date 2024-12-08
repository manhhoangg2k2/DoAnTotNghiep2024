import 'package:fare_riding_app/constant/AppColor.dart';
import 'package:fare_riding_app/models/enums/history_filter.dart';
import 'package:fare_riding_app/ui/common/AppBar.dart';
import 'package:fare_riding_app/ui/common/app_colors.dart';
import 'package:fare_riding_app/ui/common/app_loading.dart';
import 'package:fare_riding_app/ui/common/app_text_styles.dart';
import 'package:fare_riding_app/ui/pages/History/cubit/history_cubit.dart';
import 'package:fare_riding_app/ui/pages/History/view/ride_history_detail/ride_history_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

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
  late String createdDate;

  @override
  void initState() {
    _cubit = context.read<HistoryCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    String formatTimestamp(String timestamp) {
      try {
        // Chuyển chuỗi timestamp sang DateTime
        DateTime dateTime = DateTime.parse(timestamp);

        // Định dạng DateTime mà không cần locale
        final DateFormat formatter = DateFormat("d 'thg' M, yyyy");

        // Trả về chuỗi đã định dạng
        return formatter.format(dateTime);
      } catch (e) {
        return "Ngày không hợp lệ";
      }
    }
    return BlocBuilder<HistoryCubit, HistoryState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColor.white,
          appBar: AppBarBase(
            title: "Lịch sử",
            showBackButton: false,
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
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
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          decoration: BoxDecoration(
                              color: _cubit.state.historyFilter == value
                                  ? AppColor.primary
                                  : AppColor.gray_EEE,
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
              ),
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.all(20), // Thêm padding nếu cần
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(context,MaterialPageRoute(builder: (context) => RideHistoryDetail(rideHistoryRes: _cubit.state.listRideHistory[index])));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                            color: AppColor.white),
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("${_cubit.state.listRideHistory[index].status == 'completed' ? "Hoàn thành" : "Huỷ"}", style: AppTextStyle.blackS14Bold.copyWith(color: _cubit.state.listRideHistory[index].status == 'completed' ? AppColors.primary : AppColors.red),),
                                Text(formatTimestamp(_cubit.state.listRideHistory[index].createdTime!),),
                              ],
                            ),
                            SizedBox(height: 10,),
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
                                          const SizedBox(width: 8),
                                          Expanded(
                                            child: Text(
                                              _cubit.state.listRideHistory[index].pickupLocation ?? "null",
                                              style: AppTextStyle.description,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                            'assets/svg/map_green.svg',
                                            height: 25,
                                            color: AppColor.primary,
                                          ),
                                          const SizedBox(width: 8),
                                          Expanded(
                                            child: Text(
                                              _cubit.state.listRideHistory[index].dropoffLocation ?? "null",
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
                                const SizedBox(width: 15),
                                SvgPicture.asset(
                                  'assets/svg/right_arrow.svg',
                                  height: 25,
                                  color: AppColor.primary,
                                ),
                              ],
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: DashedAppDivider(),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  separatorBuilder: (context, index) => const SizedBox(height: 10),
                  itemCount: _cubit.state.listRideHistory.length,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

