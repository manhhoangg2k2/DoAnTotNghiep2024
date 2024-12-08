import 'package:fare_riding_app/splash/splash_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../router/route_config.dart';
import '../blocs/app_cubit.dart';
import 'splash_cubit.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return SplashCubit();
      },
      child: const SplashChildPage(),
    );
  }
}

class SplashChildPage extends StatefulWidget {
  const SplashChildPage({super.key});

  @override
  State<SplashChildPage> createState() => _SplashChildPageState();
}

class _SplashChildPageState extends State<SplashChildPage> {
  late final SplashCubit splashCubit;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      splashCubit = context.read<SplashCubit>();
     if(mounted) {
     }
      splashCubit.checkLogin(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) async {
        if (state.isLoggedIn) {
          context.read<AppCubit>().setLoggedIn(true);
          await context.read<AppCubit>().getUserSession();
          if(context.read<AppCubit>().state.userInfo != null)
          Get.toNamed(RouteConfig.main);
        }
        else{
          Get.toNamed(RouteConfig.signIn);

        }
      },
      child: Scaffold(
        // body: Center(
        //   child: LogoShopWidget(
        //     width: 200.w,
        //   ),
        // ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
