import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_mvc/data/response/status.dart';
import 'package:getx_mvvm_mvc/models/login/user_model.dart';
import 'package:getx_mvvm_mvc/resources/components/internet_exception_widget.dart';
import 'package:getx_mvvm_mvc/resources/routes/routes_name.dart';
import 'package:getx_mvvm_mvc/view_model/controller/home/home_view_model.dart';
import 'package:getx_mvvm_mvc/view_model/controller/user_preferences/user_preferences_view_model.dart';
class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  final homeViewModel = Get.put(HomeViewModel());

  UserPreferences userPreferences =UserPreferences();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeViewModel.userListApi();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
appBar: AppBar(
  automaticallyImplyLeading: false,
 actions: [
   IconButton(onPressed: (){
     userPreferences.removeUser().then((value) {
       Get.toNamed(RoutesName.loginView);
     });
   }, icon: Icon(Icons.logout))
 ],
),
      body: Obx((){
        switch(homeViewModel.rxRequestStatus.value){
          case Status.LOADING:
            return Center(child: CircularProgressIndicator());
          case Status.ERROR:
            if(homeViewModel.error.value == 'No Internet'){
              return InternetExceptionWidget(onPress: (){
              homeViewModel.userListApi();
              });
            }else{
              return Text(homeViewModel.error.toString());
            }

          case Status.COMPLETED:
            return ListView.builder(
              itemCount: homeViewModel.userList.value.data!.length,
                itemBuilder: (context, index){
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(homeViewModel.userList.value.data![index].avatar.toString()),
                      ),
                      title: Text(homeViewModel.userList.value.data![index].firstName.toString()),
                      subtitle: Text(homeViewModel.userList.value.data![index].email.toString()),
                    ),
                  );
                }
            );
        }

      }),
    );
  }
}
