import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../ui/pages/Authentication/sign_up/view/otp_screen.dart';
import '../ui/pages/Authentication/sign_up/view/sign_up_screen.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/signUp',
      builder: (context, state) {
        final phoneNumber = state.pathParameters['phoneNumber']!;
        return SignUpScreen(phoneNumber: phoneNumber);
      },
    ),
    GoRoute(
      path: '/otp',
      builder: (context, state) => const OtpScreen(),
    ),
    GoRoute(
        path: '/bookingScreen',
        builder: (context, state) {
          return OtpScreen();
        }),
  ],
);
