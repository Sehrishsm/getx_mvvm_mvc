
import 'package:getx_mvvm_mvc/data/network/network-api_services.dart';
import 'package:getx_mvvm_mvc/models/home/user_list_model.dart';
import 'package:getx_mvvm_mvc/resources/app_url/app_url.dart';

class HomeRepository{

  final _apiService = NetworkApiServices();

  Future<UserListModel> userListApi()async{

    dynamic response = await _apiService.getApi(AppUrl.userListApi);
    return UserListModel.fromJson(response);
  }


}