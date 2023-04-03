import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:qit_flutter/Models/productModel/productModel.dart';

class ShadowCardWidget extends StatelessWidget {
  const ShadowCardWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  final ProductModel data;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.5),
          borderRadius: const BorderRadius.all(Radius.circular(22)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  data.title!,
                  style: TextStyle(color: Get.theme.backgroundColor),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                '${data.price!.value} ${data.price!.currency}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Get.theme.backgroundColor,
                  fontSize: 16.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
