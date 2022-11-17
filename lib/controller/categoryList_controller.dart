import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:the_food_store/app_confige.dart';
import 'package:the_food_store/model/CategoryModel.dart';
class CategoryListController extends GetxController{


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCategoryList();
  }

  var categoryModel;
  var isLoading = false.obs;
  void loadingmethod(value){
    isLoading.value = value;
    update();
  }
  void getCategoryList()async{
    loadingmethod(true);
    var response = await http.get(Uri.parse(AppConfig.CATEGORY_URI));
    print(response.body);
    print(response.statusCode);
    if(response.statusCode == 200){
      categoryModel = jsonDecode(response.body);
    }else{
      categoryModel = jsonDecode(response.body);
    }
    loadingmethod(false);
  }


}