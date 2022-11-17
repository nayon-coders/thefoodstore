import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';

import '../app_theme.dart';

class Foods extends StatelessWidget {
  final double? width;
  final double? height;
  final String name;
  final String price;
  final Image image;
  final IconData icon;
  final VoidCallback onClick;
  const Foods({
    Key? key,  this.width,  this.height, required this.name, required this.price, required this.image, required this.icon, required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: EdgeInsets.only(right: 20, top: 10, bottom: 10),
      padding: EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              offset: Offset(0,2),
              spreadRadius: 2,
              blurRadius: 10,
              color: Colors.grey.shade200
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: image),
          SizedBox(height: 15,),
          Text("$name",
            textAlign: TextAlign.start,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 10.sp,
            ),
          ),

          Row(
            children: [
              Row(
                children: [
                  Icon(Icons.star, color: AppTheme.yellow, size: 12.sp,),
                  Icon(Icons.star, color: AppTheme.yellow, size: 12.sp,),
                  Icon(Icons.star, color: AppTheme.yellow, size: 12.sp,),
                  Icon(Icons.star, color: AppTheme.yellow, size: 12.sp,),
                  Icon(Icons.star, color: AppTheme.grey, size: 12.sp,),
                ],
              ),
              Text("(4.5)",style: TextStyle(color: AppTheme.red),)

            ],
          ),

          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("$price",
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.red
                ),
              ),
              InkWell(
                onTap: onClick,
                child: Container(
                  padding:EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      color: AppTheme.red.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(100)
                  ),
                  child: Icon(
                    icon,
                    color: AppTheme.red,
                  ),

                ),
              )
            ],
          )
        ],
      ),

    );
  }
}
