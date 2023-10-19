import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_mvc/resources/assets/image_assets.dart';
import 'package:getx_mvvm_mvc/resources/components/general_exception.dart';
import 'package:getx_mvvm_mvc/resources/components/internet_exception_widget.dart';
import 'package:getx_mvvm_mvc/resources/components/round_button.dart';
import 'package:getx_mvvm_mvc/utils/utils.dart';
import 'package:getx_mvvm_mvc/view_model/services/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashServices = SplashServices();
  @override

  void initState() {
    // TODO: implement initState
    super.initState();
   splashServices.isLogin();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
       body: Center(child: Text('welcome_back'.tr, textAlign: TextAlign.center,)),
    );
  }
}
