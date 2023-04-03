import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:qit_flutter/view/widgets/product_data/drawer_btn.dart';

import '../../Providers/login_provider.dart';

class HomeDrawer extends StatelessWidget {
  HomeDrawer(
    this.ref, {
    Key? key,
  }) : super(key: key);
  WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 30.h,
          ),
          const Text(
            'Settings',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ).tr(),
          Drawer_btn("change_language", Icons.language, () {
            if (context.locale == const Locale('ar', 'DZ')) {
              context.locale = const Locale('en', 'US');
            } else {
              context.locale = const Locale('ar', 'DZ');
            }
            Get.updateLocale(context.locale);
          }),
          Drawer_btn("Logout", Icons.reset_tv, () {
            ref.read(loginProvider.notifier).resetFunc(context);
          }),
        ],
      )),
    );
  }
}
