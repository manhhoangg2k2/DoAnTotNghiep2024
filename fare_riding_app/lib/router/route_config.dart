
import 'package:fare_riding_app/ui/pages/Account/view/user_detail.dart';
import 'package:fare_riding_app/ui/pages/Authentication/log_in/view/authentication_screen.dart';
import 'package:fare_riding_app/ui/pages/Home/view/home_screen.dart';
import 'package:fare_riding_app/ui/pages/MainScreen/view/main_screen.dart';
import 'package:fare_riding_app/ui/pages/RideProcess/completed_ride/cancel_ride_screen/cancel_ride_widget_2.dart';
import 'package:fare_riding_app/ui/pages/RideProcess/completed_ride/success_ride.dart';
import 'package:fare_riding_app/ui/pages/RideProcess/ride_process.dart';
import 'package:fare_riding_app/ui/pages/booking_screen/widget/choose_location/choose_locationn.dart';
import 'package:get/get.dart';

import '../splash/splash_page.dart';
import '../ui/pages/booking_screen/booking_screen.dart';



class RouteConfig {
  RouteConfig._();

  ///main page
  static const String splash = "/splash";
  static const String chooseLocation = "/chooseLocation";
  static const String booking = "/booking";
  static const String main = "/main";
  static const String signIn = "/signIn";
  static const String rideProcess = "/rideProcess";
  static const String ratingScreen = "/ratingScreen";
  static const String cancelRideScreen2 = "/cancelRideScreen2";
  static const String userDetail = "/userDetail";

  static final List<GetPage> getPages = [
    GetPage(name: splash, page: () => const SplashPage()),
    GetPage(name: chooseLocation, page: () => const ChooseLocation()),
    GetPage(name: booking, page: () => const BookingScreen()),
    GetPage(name: main, page: () => const MainScreen()),
    GetPage(name: signIn, page: () => const AuthenticationScreen()),
    GetPage(name: rideProcess, page: () => const RideProcess()),
    GetPage(name: ratingScreen, page: () => CompletedRideScreen()),
    GetPage(name: cancelRideScreen2, page: () => CancelRideWidget2()),
    GetPage(name: userDetail, page: () => UserDetail()),
  ];
}
