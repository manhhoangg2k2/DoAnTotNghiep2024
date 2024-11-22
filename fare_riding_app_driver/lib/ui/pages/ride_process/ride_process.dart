import 'package:fare_riding_app/ui/pages/ride_process/ride_process_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RideProcess extends StatefulWidget {
  const RideProcess({super.key});

  @override
  State<RideProcess> createState() => _RideProcessState();
}

class _RideProcessState extends State<RideProcess> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RideProcessCubit>(
      create: (context) => RideProcessCubit(),
      child: RideProcessScreen(),
    );
  }
}

class RideProcessScreen extends StatefulWidget {
  const RideProcessScreen({super.key});

  @override
  State<RideProcessScreen> createState() => _RideProcessScreenState();
}

class _RideProcessScreenState extends State<RideProcessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}

