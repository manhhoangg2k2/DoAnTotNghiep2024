import 'package:fare_riding_app/constant/AppColor.dart';
import 'package:fare_riding_app/constant/AppFont.dart';
import 'package:flutter/cupertino.dart';

class Mainbutton extends StatelessWidget {
  final String text;
  final int type;
  final VoidCallback onTap;

  const Mainbutton({
    Key? key,
    required this.text,
    required this.type,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return type == 1
        ? GestureDetector(
            onTap: onTap,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                decoration: BoxDecoration(
                  color: AppColor.main,
                  border: Border.all(color: AppColor.main),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    text,
                    style: TextStyle(color: AppColor.white, fontSize: 16.0, fontWeight: AppFonts.medium),
                  ),
                ),
              ),
            ),
          )
        : GestureDetector(
            onTap: onTap,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                decoration: BoxDecoration(
                  color: AppColor.white,
                  border: Border.all(color: AppColor.main),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    text,
                    style: TextStyle(color: AppColor.main, fontSize: 16.0, fontWeight: AppFonts.medium),
                  ),
                ),
              ),
            ),
          );
  }
}

class MainbuttonDisable extends StatelessWidget {
  final String text;
  final int type;
  final VoidCallback onTap;

  const MainbuttonDisable({
    Key? key,
    required this.text,
    required this.type,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return type == 1
        ? GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          width: double.infinity,
          padding:
          const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
          decoration: BoxDecoration(
            color: AppColor.main.withOpacity(0.7),
            border: Border.all(color: AppColor.main.withOpacity(0.7)),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(color: AppColor.white, fontSize: 16.0, fontWeight: AppFonts.medium),
            ),
          ),
        ),
      ),
    )
        : GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          width: double.infinity,
          padding:
          const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
          decoration: BoxDecoration(
            color: AppColor.white,
            border: Border.all(color: AppColor.main),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(color: AppColor.main, fontSize: 16.0, fontWeight: AppFonts.medium),
            ),
          ),
        ),
      ),
    );
  }
}

