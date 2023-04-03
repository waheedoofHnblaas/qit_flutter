library main;

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:qit_flutter/Models/productModel/productModel.dart';
import 'package:riverpod/riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/constants/links.dart';
import '../locat.dart';
import '../view/screens/home_page.dart';

class HomeServices {
  int page = 1;
  int limit = 20;
  List<ProductModel> products = [];




  Future<List> getProducts() async {


    Dio dio = Dio();
    try {
      print('===============getProducts()==============');
      final response = await dio.get(
        '${AppLinks.productLink}?perpage=$limit&page=$page',
        options: Options(
          headers: {'Accept': 'application/json'},
          method: 'GET',
        ),
      );
      if (response.statusCode == 200) {
        response.data['data']
            .map((model) => products.add(ProductModel.fromJson(model)))
            .toList();
        return products;
      } else {
        throw Exception('Server Access Error');
      }
    } catch (e) {
      throw Exception('No Internet Connection'.tr);
    }
  }
}



final productsProvider = Provider<HomeServices>((ref) => HomeServices());
final productsProviderlist = StateProvider((ref) => HomeServices() );
