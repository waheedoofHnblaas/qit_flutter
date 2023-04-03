library main;

import 'package:dio/dio.dart';
import 'package:qit_flutter/locat.dart';
import 'package:riverpod/riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../core/constants/links.dart';
import '../core/function/diaolg.dart';

class RegisterServices extends StateNotifier<bool> {
  RegisterServices() : super(false);

  Future<bool> register(email, username, password1, password2) async {
    final myServices = getIt<SharedPreferences>();

    bool isLogin = false;
    Dio dio = Dio();
    print(        "${AppLinks.registerLink}?email=$email&name=$username&password=$password1&password_confirmation=$password2",
    );
    try {
      print('=====register ()==============');
      final response = await dio.post(
        "${AppLinks.registerLink}?email=$email&name=$username&password=$password1&password_confirmation=$password2",
        options: Options(
          headers: {'Accept': 'application/json'},
          method: 'POST',
        ),
      );

      print(response);
      if (response.statusCode == 200) {
        Map user = response.data['user'];
        await myServices.setString('token', response.data['token']);
        await myServices.setString('email', user['email']);
        await myServices.setString('password', password1);
        await myServices.setString('name', user['name']);
        await myServices.setString('id', user['id'].toString());
        isLogin = true;
        print("register : $email");

        state = true;
        return isLogin;
      } else {
        errorDialog(response.data['message']);
        return false;
      }
    } catch (e) {
      errorDialog('data error $e');
      return false;
    }
  }
}
