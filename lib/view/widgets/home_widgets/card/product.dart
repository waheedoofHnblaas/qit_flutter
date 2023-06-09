import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qit_flutter/Models/productModel/productModel.dart';
import 'package:qit_flutter/view/widgets/home_widgets/card/image_card.dart';
import 'package:qit_flutter/view/widgets/home_widgets/card/shadow_card.dart';


class ProductCard extends StatelessWidget {
  ProductCard({super.key, required this.data});

  ProductModel data;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 15.0.w,
          vertical: 12.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                ImageCardWiget(data: data),
                ShadowCardWidget(data: data)
              ],
            ),
            const Divider()
          ],
        ),
      ),
    );
  }
}
