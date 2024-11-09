import 'package:fare_riding_app/ui/pages/booking_screen/booking_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/app_bottom_sheet.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BookingCubit>(
      create: (context) => BookingCubit(),
      child: _BookingScreen(),
    );
  }
}

class _BookingScreen extends StatefulWidget {
  const _BookingScreen({super.key});

  @override
  State<_BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<_BookingScreen> {
  late BookingCubit _cubit;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _cubit = context.read<BookingCubit>();

    // Dùng SchedulerBinding để hiển thị bottom sheet sau khi widget đã được xây dựng
    SchedulerBinding.instance.addPostFrameCallback((_) {
      AppBottomSheet.showBottomSheet(
        title: "Chọn điểm đón, điểm đến",
        body: _buildBodyBottomSheet(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  Widget _buildBodyBottomSheet() {
    return Container(
      child: Column(
        children: [
          // Nội dung của bottom sheet
        ],
      ),
    );
  }
}