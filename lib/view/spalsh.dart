import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_food_store/app_theme.dart';
import 'package:the_food_store/view/home-screen.dart';
import 'package:the_food_store/view/location/location.dart';
import 'package:the_food_store/view/ready-to-go.dart';
class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {


  @override
  void initState(){
    super.initState();
    Future.delayed(Duration(seconds: 2), () async{
      SharedPreferences _prfs = await SharedPreferences.getInstance();
     var isLogin = _prfs.getString("isLogin");
     if(isLogin == "1"){
       Get.offAll(Home());
     }else{
       Get.to(()=>ReadyScreen(), transition: Transition.rightToLeft, duration: Duration(milliseconds:1000));
     }

      print("object");
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        decoration: const BoxDecoration(
          // image: DecorationImage(
          //   image: AssetImage("assets/images/splash.png"),
          //   fit: BoxFit.cover
          // )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(child: Image.asset("assets/images/logo.png", height: 120, width: 120,)),
            SizedBox(height: 20,),
            Text("THE FOOD STORE",
              style: TextStyle(
                color: AppTheme.red,
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            )

          ],
        ),
      ),
    );
  }
}
