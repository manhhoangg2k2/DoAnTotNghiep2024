import 'package:fare_riding_app/constant/AppColor.dart';
import 'package:fare_riding_app/constant/AppFont.dart';
import 'package:fare_riding_app/constant/AppSize.dart';
import 'package:fare_riding_app/constant/AppText.dart';
import 'package:fare_riding_app/main.dart';
import 'package:fare_riding_app/ui/pages/Authentication/sign_up/cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../common/MainButton.dart';
import '../../../common/TextBase.dart';

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({super.key});

  @override
  Widget build(BuildContext context) {
        return Scaffold(
          body: Center(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.size_20,vertical: AppSizes.size_30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      SvgPicture.asset('assets/svg/welcome_screen.svg'),
                      TextBase(
                        text: AppText.welcome,
                        color: AppColor.contentSecondary,
                        fontSize: AppSizes.size_25,
                        fontWeight: AppFonts.medium,
                      ),
                      SizedBox(height: AppSizes.size_15,),
                      TextBase(
                        text: AppText.moreWelcome,
                        color: AppColor.gray_0A0,
                        fontSize: AppSizes.size_17,
                        fontWeight: AppFonts.normal,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Mainbutton(
                          text: AppText.createAccount,
                          type: 1,
                          onTap: (){}
                      ),
                      SizedBox(height: AppSizes.size_20,),
                      Mainbutton(
                          text: AppText.logIn,
                          type: 0,
                          onTap: (){}
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      }
  }
