import 'package:get/get.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qit_flutter/Providers/login_provider.dart';
import 'package:qit_flutter/Services/home_services.dart';
import 'package:qit_flutter/view/widgets/product_data/floating_btn_stack.dart';
import '../../Models/productModel/productModel.dart';
import '../../Providers/loadinf_provider.dart';
import '../../Providers/products_provider.dart';
import '../../core/constants/appRoutes.dart';
import '../widgets/home_widgets/card/product.dart';

import '../widgets/page_drawer.dart';

class HomePage extends ConsumerWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(productsDataProvider);

    bool loginState = ref.watch(loginProvider);

    print('=============isLogin==${loginState}================');
    return Scaffold(
      drawer: HomeDrawer(ref),
      appBar: AppBar(
        title: const Text("Dashboard").tr(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // floatingActionButton: const FloatingButton(),
      body: data.when(
        skipError: true,
        data: (data) {
          List<ProductModel> products =
              data.map((e) => e as ProductModel).toList();

          ScrollController sc = ScrollController();
          sc.addListener(() {
            if (sc.position.maxScrollExtent == sc.offset) {

              print('==================getAgain=============');

            }
          });

          print(products.length);
          return Center(
            child: Stack(
              children: [
                ListView.builder(
                  controller: sc,
                  shrinkWrap: true,
                  primary: false,
                  itemCount: products.length + 1,
                  itemBuilder: (context, index) {
                    return index < products.length
                        ? InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, '${AppRoutes.productData}/$index');
                              print('navigateTo');
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 15.0.w,
                                vertical: 12.h,
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    products[index].id.toString(),
                                    style: TextStyle(fontSize: 22.sp),
                                  ),
                                  ProductCard(
                                    data: products[index],
                                  ),
                                ],
                              ),
                            ),
                          )
                        : Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 160.0.w,
                              vertical: 10.h,
                            ),
                            child: const CircularProgressIndicator(),
                          );
                  },
                ),
                SizedBox(
                  height: 60.h,
                ),
                Consumer(
                  builder: (context, ref, child) {
                    return !loginState
                        ? FloatingButtonStack(
                            text: 'Login',
                            widget: Icon(
                              Icons.question_mark_outlined,
                              color: Get.theme.scaffoldBackgroundColor,
                            ),
                          )
                        : Container();
                  },
                ),
              ],
            ),
          );
        },
        error: (error, stackTrace) => Center(
          child: Column(
            children: [
              Text(error.toString()),
              IconButton(
                  onPressed: () {
                    ref.read(LoadingStateProvider.notifier).state = true;

                    ref.refresh(productsDataProvider);
                    ref.read(LoadingStateProvider.notifier).state = false;

                  },
                  icon: const Icon(Icons.refresh))
            ],
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
