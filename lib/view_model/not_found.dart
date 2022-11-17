import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:the_food_store/app_theme.dart';

class NotFound extends StatelessWidget {
  final String title;
  const NotFound({
    Key? key, required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset("assets/images/not-fount.json",
              repeat: false,
              width: 200,
              height: 200
          ),
          Text("$title",
            style: TextStyle(fontSize: 18, color: AppTheme.red),
          )
        ],
      ),
    );
  }
}
