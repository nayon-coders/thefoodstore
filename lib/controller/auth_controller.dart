import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_food_store/controller/tost_controller.dart';
import 'package:the_food_store/view/home-screen.dart';
import 'package:the_food_store/view/sign-up.dart';
import 'package:the_food_store/view_model/popup.dart';

import '../app_confige.dart';
class AuthController extends GetxController{

  var isCheckEmail = false.obs;
  var isCheckEmailerror = false.obs;
  var isSignUp = false.obs;
  var isLoading = false.obs;
  var isSignInError = false.obs;
  void loading(value){
    isLoading.value = value;
    update();
  }
  void _checkEmailLoading(value){
    isCheckEmail.value = value;
    update();
  }
  void _isCheckEmailerrorLoading(value){
    isCheckEmailerror.value = value;
    update();
  }
  void _isSignUpLoading(value){
    isSignUp.value = value;
    update();
  }
  void SignInError(value){
    isSignInError.value = value;
    update();
  }
  var checkImageItems;
  var signInError;



  void checkEmail(email)async{
    _checkEmailLoading(true);
    var response = await http.post(Uri.parse(AppConfig.CHECK_EMAIL_URI),
      body: {
        "email" : email
      }
    );
    print(response.statusCode);
    print(response.body);
    if(response.statusCode == 200){
      _isCheckEmailerrorLoading(false);
      checkImageItems = jsonDecode(response.body);
      print("ok");
      Get.to(SignUp(email: email));
    }else{
      _isCheckEmailerrorLoading(true);
      isCheckEmailerror.value = true;
      checkImageItems = jsonDecode(response.body);
    }
    _checkEmailLoading(false);
  }



  //sing Up system
  void signUp(fname, lname, email, phone, pass)async{
    _isSignUpLoading(true);
    print(email);
    SharedPreferences _prefs = await SharedPreferences.getInstance();

    var response = await http.post(Uri.parse(AppConfig.REGISTER_URI),
      body: {
        "f_name" : fname,
        "l_name" : lname,
        "email" : email,
        "password": pass,
        "phone" : phone,
      }
    );

    var data = jsonDecode(response.body);
    print(response.statusCode);
    print(response.body);
    if(response.statusCode == 200){
      _prefs.setString("token", "${data["token"]}");
      Get.offAll(Home());
    }else{
      PopUp.errorPoup(jsonDecode(response.body)["errors"][0]["message"]);
      print("some this worng");
    }

    _isSignUpLoading(false);
  }


  //login
  void login(email, pass)async{
    SharedPreferences _prfs = await SharedPreferences.getInstance();
    loading(true);
    var response = await http.post(Uri.parse(AppConfig.LOGIN_URI),
      body: {
        "email":email,
        "password":pass
      }
    );
    print(response.body);
    if(response.statusCode == 200){
      _prfs.setString("token", "${jsonDecode(response.body)["token"]}");
      _prfs.setString("isLogin", "1");
      Get.offAll(Home());
    }else{
      AppPopUp.showTost(title: "${jsonDecode(response.body)["errors"][0]["message"]}");
    }

    loading(false);

  }


}