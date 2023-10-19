
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_mvc/resources/colors/app_colors.dart';

class Utils{


  static void fieldFocusChange(BuildContext context, FocusNode current, FocusNode nextFocus){
  current.unfocus();
  FocusScope.of(context).requestFocus(nextFocus);
  }


  static toastMessage(String message){

Fluttertoast.showToast(
    msg: message,
  backgroundColor: AppColors.blackColor,
  gravity: ToastGravity.BOTTOM,
);

  }


  static toastMessageCenter(String message){

    Fluttertoast.showToast(
      msg: message,
      backgroundColor: AppColors.blackColor,
      gravity: ToastGravity.CENTER,
    );

  }

  static snackBar(String title, String message){
Get.snackbar(title, message);
  }
}