import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/constants/appRoutes.dart';

class FloatingButtonStack extends StatelessWidget {
  FloatingButtonStack({Key? key, required this.widget, required this.text})
      : super(key: key);

  Widget widget;
  String text;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20.h,
      left: 30.w,
      right: 30.w,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            AppRoutes.login,
          );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(22.r),
            ),
            color: Get.theme.primaryColor.withOpacity(0.9),
          ),
          height: 60.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.sp,
                  color: Get.theme.scaffoldBackgroundColor,
                ),
              ).tr(),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 0.4,
                    color: Get.theme.scaffoldBackgroundColor,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: widget,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
