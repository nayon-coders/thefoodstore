import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';

import '../app_theme.dart';
import '../json.dart';
class GriderFoodsList extends StatelessWidget {
  final int index;
  final String title;
  final Image images;
  final double rating;
  final String price;
  final VoidCallback onClickAddtoCart;
  final VoidCallback onClick;
  const GriderFoodsList({
    Key? key, required this.index, required this.title, required this.images, required this.rating, required this.price, required this.onClickAddtoCart, required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        margin: EdgeInsets.only( top: 10, bottom: 7),
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
            Center(child: images),
            SizedBox(height: 15,),
            Text("$title",
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
                Text("$rating",style: TextStyle(color: AppTheme.red),)

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
                  onTap: onClickAddtoCart,
                  child: Container(
                    padding:EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        color: AppTheme.red.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(100)
                    ),
                    child: Icon(
                      Icons.add,
                      color: AppTheme.red,
                    ),

                  ),
                )
              ],
            )
          ],
        ),

      ),
    );
  }
}
