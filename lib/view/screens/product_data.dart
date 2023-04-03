import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:qit_flutter/Models/productModel/productModel.dart';
import 'package:qit_flutter/view/widgets/home_widgets/card/image_card.dart';
import 'package:qit_flutter/view/widgets/product_data/floating_btn_stack.dart';
import '../../Providers/products_provider.dart';
import '../widgets/page_drawer.dart';

class ProductDataPage extends ConsumerWidget {
  ProductDataPage({
    Key? key,
    required this.productIndex,
  }) : super(key: key);
  int productIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List> data = ref.watch(productsDataProvider);

    return data.when(
      data: (data) {
        List<ProductModel> products =
            data.map((e) => e as ProductModel).toList();
        return Scaffold(
          drawer: HomeDrawer(ref),
          appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(CupertinoIcons.arrow_down_right_arrow_up_left),
              ),
            ],
            title: Text('PN ${productIndex + 1}'),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22.0),
            child: Center(
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ImageCardWiget(data: products[productIndex]),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          products[productIndex].title!,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 21.sp, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          products[productIndex].description!,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18.sp),
                        ),
                        Container(
                          height: 110.h,
                        )
                      ],
                    ),
                  ),
                  FloatingButtonStack(
                    text:
                        '${products[productIndex].price!.value} ${products[productIndex].price!.currency} ',
                    widget: Icon(
                      Icons.add,
                      color: Get.theme.scaffoldBackgroundColor,
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
      error: (error, stackTrace) => Center(child: Text(error.toString())),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
