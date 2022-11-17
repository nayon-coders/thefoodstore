import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:the_food_store/app_confige.dart';

import '../model/PopulerProductListModel.dart';


class ProductController extends GetxController{

  var populerProductListModel;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getPopullerProduct();
  }


  var popullerProductLoading = false.obs;
  void popullerProductloadingMethod(value){
    popullerProductLoading.value = value;
    update();
  }
  getPopullerProduct()async{
    popullerProductloadingMethod(true);
    var response = await http.get(Uri.parse(AppConfig.POPULAR_PRODUCT_URI));
    print("body product ${response.body}");
    if(response.statusCode == 200){
      populerProductListModel = jsonDecode(response.body);
    }else{
      populerProductListModel = jsonDecode(response.body);
    }
    popullerProductloadingMethod(false);
  }


}