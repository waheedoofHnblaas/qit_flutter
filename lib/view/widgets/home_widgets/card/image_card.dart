import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qit_flutter/Models/productModel/productModel.dart';

class ImageCardWiget extends StatelessWidget {
  const ImageCardWiget({
    Key? key,
    required this.data,
  }) : super(key: key);

  final ProductModel data;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: ScreenUtil.defaultSize.width.w,
      height: 200.h,
      imageBuilder: (context, imageProvider) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(18)),
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.fill,
            ),
          ),
        );
      },
      imageUrl: data.image!.conversions!.large!,
      placeholder: (context, url) => Padding(
        padding: EdgeInsets.symmetric(
          horizontal: ScreenUtil.defaultSize.width / 2,
          vertical: ScreenUtil.defaultSize.width / 4,
        ),
        child: const CircularProgressIndicator(),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
