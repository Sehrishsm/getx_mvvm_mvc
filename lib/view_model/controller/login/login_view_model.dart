
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_mvc/models/login/user_model.dart';
import 'package:getx_mvvm_mvc/repository/login_repository/login_repository.dart';
import 'package:getx_mvvm_mvc/resources/routes/routes_name.dart';
import 'package:getx_mvvm_mvc/utils/utils.dart';
import 'package:getx_mvvm_mvc/view_model/controller/user_preferences/user_preferences_view_model.dart';

class LoginViewModel extends GetxController{

  final _api = LoginRepository();
  UserPreferences userPreferences= UserPreferences();

  final emailController = TextEditingController().obs;

  final passwordController = TextEditingController().obs;

  final emailFocusNode = FocusNode().obs;

  final passwordFocusNode = FocusNode().obs;

   RxBool loading = false.obs;

  void loginApi(){
    loading.value= true;
    Map data ={
      'email': emailController.value.text,
      'password': passwordController.value.text,
    };
_api.loginApi(data).then((value) {
  loading.value = false;
  if(value['error']=='user not found'){
    Utils.snackBar('Login',value['error']);
  }else{
userPreferences.saveUser(UserModel.fromJson(value)).then((value) {
Get.toNamed(RoutesName.homeView);
}).onError((error, stackTrace) {

});
Utils.snackBar('Login', 'login successfully');
  }

}).onError((error, stackTrace) {
  print(error.toString());
  loading.value = false;
  Utils.snackBar('Error', error.toString());
});
  }
}