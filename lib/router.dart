import 'package:fluro/fluro.dart';
import 'package:qit_flutter/view/screens/home_page.dart';
import 'package:qit_flutter/view/screens/login_page.dart';
import 'package:qit_flutter/view/screens/product_data.dart';
import 'package:qit_flutter/view/screens/register_page.dart';

import 'core/constants/appRoutes.dart';

class RouterPages {
  final FluroRouter fluroRouter = FluroRouter();

  static var dataPageHandler = Handler(
    handlerFunc: (context, parameters) {
      return ProductDataPage(productIndex: int.parse(parameters['id']![0]));
    },
  );
  static var homePageHandler = Handler(
    handlerFunc: (context, parameters) {
      return   HomePage();
    },
  );
  static var loginPageHandler = Handler(
    handlerFunc: (context, parameters) {
      return  LoginPage();
    },
  );
  static var registerPageHandler = Handler(
    handlerFunc: (context, parameters) {
      return  RegisterPage();
    },
  );

  RouterPages() {
    fluroRouter.define(
      '${AppRoutes.productData}/:id',
      handler: dataPageHandler,
      transitionType: TransitionType.fadeIn,
    );
    fluroRouter.define(
      AppRoutes.home,
      handler: homePageHandler,
      transitionType: TransitionType.fadeIn,
    );
    fluroRouter.define(
      AppRoutes.login,
      handler: loginPageHandler,
      transitionType: TransitionType.fadeIn,
    );
    fluroRouter.define(
      AppRoutes.register,
      handler: registerPageHandler,
      transitionType: TransitionType.fadeIn,
    );
  }
}
