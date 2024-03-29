
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:getx_mvvm_mvc/data/app_exception.dart';
import 'package:getx_mvvm_mvc/data/network/base_api_services.dart';
import 'package:http/http.dart'as http;
class NetworkApiServices extends BaseApiServices{

  @override
  Future<dynamic> getApi(String url)async{

    if (kDebugMode) {
      print(url);
    }
    dynamic jsonResponse;
    try{
      final response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      jsonResponse = returnResponse(response);
    }on SocketException{
      throw InternetException('');
    }on RequestTimeOut{
      throw RequestTimeOut('');
    }

    return jsonResponse;
  }

  Future<dynamic> postApi(var data ,String url)async{

    if (kDebugMode) {
      print(url);
      print(data);
    }
    dynamic jsonResponse;
    try{
      final response = await http.post(Uri.parse(url),
        body: data,
      ).timeout(const Duration(seconds: 10));
      jsonResponse = returnResponse(response);
    }on SocketException{
      throw InternetException('');
    }on RequestTimeOut{
      throw RequestTimeOut('');
    }
    if (kDebugMode) {
      print(jsonResponse);
    }
    return jsonResponse;
  }

  dynamic returnResponse(http.Response response){
switch(response.statusCode){
  case 200:
    dynamic responseJson = jsonDecode(response.body);
    return responseJson;
  case 400:
    dynamic responseJson = jsonDecode(response.body);
    return responseJson;

 default:
   throw FetchDataException('error occur while communicating to server' + response.statusCode.toString());
}
  }
}