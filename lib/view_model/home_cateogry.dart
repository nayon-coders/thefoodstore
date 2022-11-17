import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';
import 'package:the_food_store/app_theme.dart';
import 'package:the_food_store/controller/categoryList_controller.dart';
import 'package:http/http.dart' as http;
import 'package:the_food_store/view/category_foods_list.dart';
import 'package:the_food_store/view_model/loading_with_logo.dart';

import '../app_confige.dart';
class homeCategory extends StatefulWidget {
   homeCategory({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<homeCategory> createState() => _homeCategoryState();
}

class _homeCategoryState extends State<homeCategory> {

  @override
  Widget build(BuildContext context) {
      var size = MediaQuery.of(context).size;
    return GetBuilder<CategoryListController>(
      init: CategoryListController(),
      builder: (catController) {
        return Container(
          height:110,
          width: widget.size.width,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: catController.categoryModel?.length,
            itemBuilder: (_, index){
              var data = catController.categoryModel?[index];
                return catController.isLoading.value ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    loadingWithLogo(height: 100, width: 100,),
                    SizedBox(height: 5,),
                    Shimmer.fromColors(
                      baseColor: AppTheme.white,
                      highlightColor: AppTheme.grey200,
                      child: Container(
                        margin: EdgeInsets.only(right: 20),
                        width: 70,
                      ),
                    )
                  ],
                ): Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: ()=>Get.to(CategoryFoodsList(id: "${data["id"]}" , name: "${data["name"]}", image: '${data["image"]}', )),
                    child: Container(
                      width: 80,
                      height: 80,
                      margin: EdgeInsets.only(right: 20),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFFf1f1f1f1),
                      ),
                      child: Image.network("https://portal.thefoodstore.app/storage/app/public/category/${data["image"]}", height: 40, width: 40, ),
                    ),
                  ),
                  SizedBox(height: 5,),
                  Container(
                    margin: EdgeInsets.only(right: 20),
                    child: Text("${data["name"]} ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  )
                ],
              );
            },
          ),

        );
      }
    );
  }
}
