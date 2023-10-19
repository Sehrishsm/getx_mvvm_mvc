import 'package:get/get.dart';
import 'dart:async';

import 'package:getx_mvvm_mvc/resources/routes/routes_name.dart';
import 'package:getx_mvvm_mvc/view_model/controller/user_preferences/user_preferences_view_model.dart';

class SplashServices{
  UserPreferences userPreferences = UserPreferences();
   void isLogin(){

     userPreferences.getUser().then((value) {
       print(value.token);
 if(value.token!.isEmpty || value.token.toString() == 'null'){
   Timer(const Duration(seconds:  3),
           ()=> Get.toNamed(RoutesName.loginView));
 }else{
   Timer(const Duration(seconds:  3),
           ()=> Get.toNamed(RoutesName.homeView));
 }
     });

   }
}