import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_mvc/resources/colors/app_colors.dart';
class InternetExceptionWidget extends StatefulWidget {

  final VoidCallback onPress;
  const InternetExceptionWidget({Key? key, required this.onPress}) : super(key: key);

  @override
  State<InternetExceptionWidget> createState() => _InternetExceptionWidgetState();
}

class _InternetExceptionWidgetState extends State<InternetExceptionWidget> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height ;
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(
            height: height *.15,
          ),
          Icon(Icons.cloud_off, color: AppColors.redColor,size: 50,),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Center(child: Text('Internet_Exception'.tr, textAlign: TextAlign.center ,)),
          ),
          SizedBox(
            height: height *.15,
          ),
          InkWell(
            onTap: widget.onPress,
            child: Container(
              height: 44,
              width: 160,
              decoration: BoxDecoration(
       // color: AppColors.primaryColor,
                color: Colors.purple.shade50,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Center(child: Text('Retry', style: Theme.of(context).textTheme.titleMedium),
            ),
            ),
          ),
        ],
      ),
    );
  }
}
