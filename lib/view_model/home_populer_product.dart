import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_food_store/app_confige.dart';
import 'package:the_food_store/controller/product_controller.dart';
import 'package:the_food_store/view_model/loading_with_logo.dart';

import '../view/single-food.dart';
import 'grider-foods-list.dart';
import 'not_found.dart';

class HomePopulerProduct extends StatelessWidget {
   HomePopulerProduct({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;


  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
      init: ProductController(),
      builder: (productController) {
         return productController.popullerProductLoading.value ? Container(
           width: size.width,
           child: GridView.builder(
               physics: NeverScrollableScrollPhysics(),
               shrinkWrap: true,
               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                 crossAxisCount: 2,
                 crossAxisSpacing: 15.0,
                 mainAxisSpacing: 0.0,
                 mainAxisExtent: 220,
               ),
               itemCount:10,
               itemBuilder: (BuildContext ctx, index) {
                 return loadingWithLogo(height: 100, width: size.width/2.2);
               }),


         )
            : productController.populerProductListModel?.length == 0 ?NotFound(title: "Food not found",): Container(
          width: size.width,
          child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15.0,
                mainAxisSpacing: 0.0,
                mainAxisExtent: 220,
              ),
              itemCount:productController.populerProductListModel?["products"]?.length,
              itemBuilder: (BuildContext ctx, index) {
                var products = productController.populerProductListModel?["products"]?[index];
                print("product list $products");
               return GriderFoodsList(
                  onClick: ()=>Get.to(SingleFood(id: "${products?["id"]}"), transition: Transition.rightToLeft),
                  onClickAddtoCart: (){},
                  index: index,
                  title: "${products?["name"]}",
                  images: Image.network("${AppConfig.PRODUCT_URL+products?["image"]}", height: 80, width: 120, fit: BoxFit.cover,),
                  rating: products?["rating"].length == 0 ? 0.0 : 4.5,
                  price: "${products?["price"]}",
                );
              }),


        );
      }
    );
  }
}
