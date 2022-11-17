import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_food_store/app_confige.dart';
import 'package:the_food_store/controller/local_database_controller.dart';
import 'package:the_food_store/view/userProfileModel.dart';

class UserProfileController extends GetxController{

  UserProfileModel? userProfileModel;
  LocalDB localDB = Get.put(LocalDB());

  var isLoading = false.obs;
  void loading(value){
    isLoading.value = value;
    update();
  }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getProfile();
  }
  void getProfile()async{
    loading(true);
    SharedPreferences _prfs = await SharedPreferences.getInstance();
    var token = _prfs.getString("token");
    print("token $token");

    var response = await http.get(Uri.parse(AppConfig.CUSTOMER_INFO_URI),
        headers: {
          "Authorization" : "Bearer $token",
        }
    );
    if(response.statusCode == 200){
      userProfileModel = UserProfileModel.fromJson(jsonDecode(response.body));
    }else{
      print("something worng");
    }
    loading(false);
  }



}