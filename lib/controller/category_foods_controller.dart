import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:the_food_store/app_confige.dart';

class CategoryFoodController extends GetxController{

  var categoryFoods;

  var isLoading = false.obs;
  void loadingMethod(value){
    isLoading.value = value;
    update();
  }

  getCategorProduct(id)async{
    loadingMethod(true);
    var response = await http.get(Uri.parse(AppConfig.CATEGORY_PRODUCT_URI+"$id"));
    if(response.statusCode == 200){
      categoryFoods = jsonDecode(response.body);
    }else{
      categoryFoods = jsonDecode(response.body);
    }
    loadingMethod(false);
  }



}