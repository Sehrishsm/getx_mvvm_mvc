import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_mvc/resources/components/round_button.dart';
import 'package:getx_mvvm_mvc/utils/utils.dart';
import 'package:getx_mvvm_mvc/view_model/controller/login/login_view_model.dart';
class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

final loginViewModelController = Get.put(LoginViewModel());
final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Login_Screen'.tr),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.purple.shade50,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: loginViewModelController.emailController.value,
                    focusNode: loginViewModelController.emailFocusNode.value,
                    validator: (value){
                      if(value!.isEmpty){
                        Utils.snackBar('Email', 'Enter email');
                      }
                    },
                    onFieldSubmitted: (value){
                      Utils.fieldFocusChange(context, loginViewModelController.emailFocusNode.value, loginViewModelController.passwordFocusNode.value);
                    },
                    decoration: InputDecoration(
                        hintText:'email_hint'.tr,
                        border: OutlineInputBorder()
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: loginViewModelController.passwordController.value,
                    focusNode: loginViewModelController.passwordFocusNode.value,
                    obscureText: true,
                    obscuringCharacter: "*",
                    validator: (value){
                      if(value!.isEmpty){
                        Utils.snackBar('Password', 'Enter Password');
                      }
                    },
                    onFieldSubmitted: (value){

                    },
                    decoration: InputDecoration(
                        hintText:'password_hint'.tr,
                        border: OutlineInputBorder()
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 40,
            ),
            Obx(() => RoundButton(
                loading: loginViewModelController.loading.value,
                width: 200,
                title: 'Login'.tr, onPress: (){
              if(_formKey.currentState!.validate()){
             loginViewModelController.loginApi();
              }
            }
            ),),
          ],
        ),
      ),
    );
  }
}
