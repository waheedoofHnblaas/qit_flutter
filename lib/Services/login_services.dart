library main;

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:qit_flutter/core/function/checkinternet.dart';
import 'package:qit_flutter/locat.dart';
import 'package:riverpod/riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Providers/loadinf_provider.dart';
import '../core/constants/appRoutes.dart';
import '../core/constants/links.dart';
import '../core/function/diaolg.dart';

class LoginServices extends StateNotifier<bool> {
  LoginServices() : super(false){
    isLogin();
  }



  Future<bool> login(email, password) async {

      final myServices = getIt<SharedPreferences>();

      bool isLogin = false;
      Dio dio = Dio();
      try {
        print('=====login ()==============');
        final response = await dio.post(
          "${AppLinks.loginLink}?email=$email&password=$password",
          options: Options(
            headers: {'Accept': 'application/json'},
            method: 'POST',
          ),
        );


        if (response.statusCode == 200) {
          Map user = response.data['user'];
          await myServices.setString('token', response.data['token']);
          await myServices.setString('email', user['email']);
          await myServices.setString('password', password);
          await myServices.setString('name', user['name']);
          await myServices.setString('id', user['id'].toString());
          isLogin = true;
          print("login : $email");

          state = true;
          return isLogin;
        } else {
          errorDialog(response.data['message']);
          return false;
        }
      } catch (e) {
        errorDialog('password or email error');
        return false;
      }
    // } else {
    //   errorDialog('internet connection error');
    //   return false;
    // }
  }

  void isLogin() {
    if (getIt<SharedPreferences>().containsKey('email')) {
      login(
        getIt<SharedPreferences>().getString('email'),
        getIt<SharedPreferences>().getString('password'),
      );
    }

  }

  void resetFunc(context) {
    getIt<SharedPreferences>().clear();
    state = false;
    Navigator.pushNamed(
      context,
      AppRoutes.login,
    );
  }
}
