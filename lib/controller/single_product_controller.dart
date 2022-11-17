import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../app_confige.dart';

class SingleFoodController extends GetxController{
  var singleProductsList;
  var isLoading = false.obs;
  var isOpen = false.obs;

  void loadingMethod(value){
    isLoading.value = value;
    update();
  }

  DateTime now = DateTime.now();
  String currentTimeFormet = DateFormat.Hms().format(DateTime.now());



  void getSingleProduct(id)async{
    loadingMethod(true);
    var response = await http.get(Uri.parse(AppConfig.PRODUCT_DETAILS_URI+"$id") );
    print(response.statusCode);
    if(response.statusCode == 200){
      singleProductsList = jsonDecode(response.body);

      var time = DateTime.now();
      var cureTime = DateFormat("hh:mm:ss").format(time);
      var openTime = singleProductsList['available_time_starts'];
      var closeTime = singleProductsList['available_time_ends'];

      if(cureTime == openTime){
        isOpen.value = true;
        if(cureTime == closeTime){
          isOpen.value = false;
        }
      }
      print(isOpen.value);



    }else{
      singleProductsList = jsonDecode(response.body);
    }
    loadingMethod(false);

  }


}