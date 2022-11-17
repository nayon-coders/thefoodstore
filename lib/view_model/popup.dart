import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class PopUp{
  static void errorPoup(title){
    Get.defaultDialog(
        title: "",
        titlePadding: EdgeInsets.zero,
        titleStyle: TextStyle(
          fontSize: 0,
        ),
        content: Column(
          children: [
            Lottie.asset("assets/images/error.json",
              height: 150,
              width: 150,
              repeat: true,
            ),
            SizedBox(height: 20,),
            Text("${title}",
              style: TextStyle(
                fontSize: 15,
              ),
            )
          ],
        )
    );
  }
}