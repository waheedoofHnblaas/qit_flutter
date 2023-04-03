import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:qit_flutter/core/constants/appRoutes.dart';
import 'package:qit_flutter/locat.dart';
import 'package:qit_flutter/router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await setup();
  await ScreenUtil.ensureScreenSize();

  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) {
        return EasyLocalization(
          supportedLocales: const [Locale('en', 'US'), Locale('ar', 'DZ')],
          saveLocale: true,
          fallbackLocale: const Locale('en', 'US'),
          path: "assets/translations",
          child: const ProviderScope(
            child: MyApp(),
          ),
        );
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.home,
          onGenerateRoute: getIt<RouterPages>().fluroRouter.generator,
          title: 'Flutter Qit',
          theme: ThemeData(
            fontFamily: 'Cairo',
            floatingActionButtonTheme:
                const FloatingActionButtonThemeData(iconSize: 10),
            primaryColor: Colors.blue,
            backgroundColor: Colors.white,
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: AppBarTheme(
              centerTitle: true,
              foregroundColor: Get.theme.primaryColor,
              color: Get.theme.scaffoldBackgroundColor,
              elevation: 0,
            ),
            textTheme: TextTheme(
              button: TextStyle(fontSize: 16.sp),
            ),
          ),
          home: child,
        );
      },
    );
  }
}
