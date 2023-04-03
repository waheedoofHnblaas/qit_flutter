
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Drawer_btn extends StatelessWidget {
  Drawer_btn(this.text, this.iconData, this.param2, {
    Key? key,
  }) : super(key: key);

  Null Function() param2;
  String text;
  IconData iconData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: param2,
      child: Padding(
        padding: EdgeInsets.all(10.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(iconData),
            SizedBox(
              width: 22.w,
            ),
            Text(text).tr(),
          ],
        ),
      ),
    );
  }
}