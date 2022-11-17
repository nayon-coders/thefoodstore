import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:the_food_store/app_confige.dart';
import 'package:the_food_store/model/BannerModel.dart';
class BannerController extends GetxController{

  onInit(){
    super.onInit();
    getBanner();
  }

  var bannerModel;

  var isLoading = false.obs;
  void loadingMethod(value){
    isLoading.value = value;
    update();
  }
  getBanner()async{
    loadingMethod(true);

    var response = await http.get(Uri.parse(AppConfig.BANNER_URI));
    print("banner ${response.body}");
    if(response.statusCode == 200){
      loadingMethod(false);
      bannerModel = jsonDecode(response.body);
    }else{
      loadingMethod(false);
      bannerModel = jsonDecode(response.body);
    }
    loadingMethod(false);
    print(isLoading);
  }


}