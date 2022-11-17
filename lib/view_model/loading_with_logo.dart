import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:the_food_store/app_theme.dart';

class loadingWithLogo extends StatelessWidget {
  const loadingWithLogo({
    Key? key, required this.height, required this.width,

  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      highlightColor: Colors.white,
      baseColor: AppTheme.white,
      child: Container(
        color: Colors.transparent,
        width: width,
        height: height,
        child: Center(
          child: Image.asset("assets/images/logo.png", fit: BoxFit.cover),
        ),
      ),
    );
  }
}
