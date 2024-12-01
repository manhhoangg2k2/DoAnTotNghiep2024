import 'package:fare_riding_app/ui/pages/ride_process/ride_process_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompletedRideScreen extends StatelessWidget {
  const CompletedRideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RideProcessCubit>(
      create: (context) => RideProcessCubit(),
      child: _CompletedRideScreen(),
    );
  }
}

class _CompletedRideScreen extends StatefulWidget {
  const _CompletedRideScreen({super.key});

  @override
  State<_CompletedRideScreen> createState() => _CompletedRideScreenState();
}

class _CompletedRideScreenState extends State<_CompletedRideScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Text("Chuyến xe hoàn thành"),

          ],
        ),
      ),
    );
  }
}

