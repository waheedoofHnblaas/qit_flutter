import 'package:get_it/get_it.dart';
import 'package:qit_flutter/router.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  getIt.registerSingleton<RouterPages>(RouterPages());
  getIt.registerSingleton<SharedPreferences>(await SharedPreferences.getInstance());


}
