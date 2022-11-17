import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:the_food_store/view/location/location-map.dart';
import 'package:the_food_store/view/location/location.dart';

import '../../app_theme.dart';
class GetStartLocation extends StatefulWidget {
  const GetStartLocation({Key? key}) : super(key: key);

  @override
  State<GetStartLocation> createState() => _GetStartLocationState();
}

class _GetStartLocationState extends State<GetStartLocation> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        padding: EdgeInsets.only(top: 30, ),
        decoration: BoxDecoration(
          color: AppTheme.yellow,
          gradient: LinearGradient(
            colors: [
              AppTheme.yellow,
              AppTheme.red,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset("assets/images/logo.png", height: 100, width: 100, fit: BoxFit.cover,)),
            Padding(
              padding: EdgeInsets.only(left: 30, right: 30),
              child: Text("Welcome, THE FOOD STORE!",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 40.sp,
                    fontWeight: FontWeight.w100,
                    color: Color(0xFFF1F1F1)
                ),
              ),
            ),

            //Image.asset("assets/images/logo.png", height: 200,  width: size.width,),

            Column(

              children: [

                Text(
                  "SELECT LOCATION",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: AppTheme.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp
                  ),
                ),
                SizedBox(height: 10,),
                InkWell(
                  onTap: ()=>Get.to(LocationMap(), transition: Transition.rightToLeft),
                  child: Container(
                    width: size.width,
                    margin: EdgeInsets.only(left: 40, right: 40),
                    padding: EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: AppTheme.red,
                        ),
                        Text(
                          "Provide Delivery Location",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: AppTheme.red,
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )

          ],
        ),

      ),
    );
  }
}
