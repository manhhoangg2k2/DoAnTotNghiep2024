import 'dart:math';

import 'package:fare_riding_app/blocs/app_cubit.dart';
import 'package:fare_riding_app/router/route_config.dart';
import 'package:fare_riding_app/ui/pages/Authentication/log_in/cubit/authentication_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/date_symbol_data_file.dart';

import 'configs/mqtt_manager.dart';
import 'di/repository_module.dart';
import 'firebase_options.dart';

void main() async {
  String generateRandomString(int length) {
    const String chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#\$%^&*()_+-=[]{}|;:,.<>?';
    Random random = Random();

    return List.generate(length, (index) => chars[random.nextInt(chars.length)]).join();
  }
  Get.testMode = true;
  WidgetsFlutterBinding.ensureInitialized();
  final hasPermission = await _handleLocationPermission();
  if (!hasPermission) {
    print("Permission denied. The app may not function as intended.");
  }
  try {
    await repoConfigDI();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await MQTTManager().initialize(
      server: 'broker.hivemq.com',
      port: 1883,
      clientId: generateRandomString(20),
      username: '',
      password: '',
    );
    runApp(const MyApp());
  } catch (e) {
    print('Error initializing Firebase or DI: $e');
  }
}

Future<bool> _handleLocationPermission() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    print('Location services are disabled.');
    return false;
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      print('Location permissions are denied.');
      return false;
    }
  }

  if (permission == LocationPermission.deniedForever) {
    print('Location permissions are permanently denied.');
    return false;
  }

  return true;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationCubit>(
          create: (context) => AuthenticationCubit(),
        ),
        BlocProvider<AppCubit>(
          create: (context) => AppCubit()..init()
        ),
      ],
      child: ScreenUtilInit(
        useInheritedMediaQuery: true,
        designSize: const Size(393, 852),
        builder: (context, child){
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Fare Riding App',
            initialRoute: RouteConfig.splash,
            getPages: RouteConfig.getPages,
          );
        },
      ),
    );
  }
}
