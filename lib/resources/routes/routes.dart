

import 'package:get/get.dart';
import 'package:getx_mvvm_mvc/resources/routes/routes_name.dart';
import 'package:getx_mvvm_mvc/view/home/home_view.dart';
import 'package:getx_mvvm_mvc/view/login/login_view.dart';
import 'package:getx_mvvm_mvc/view/splash_screen.dart';

class AppRoutes{

  static appRoutes()=>[
GetPage(name: RoutesName.splashScreen, page: () => SplashScreen(),
    transitionDuration: Duration(milliseconds: 250),
    transition: Transition.leftToRightWithFade),

    GetPage(name: RoutesName.loginView, page: () => LoginView(),
        transitionDuration: Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),

    GetPage(name: RoutesName.homeView, page: () => HomeView(),
        transitionDuration: Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade),
  ];
}