import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'package:the_food_store/app_confige.dart';
import 'package:the_food_store/app_theme.dart';
import 'package:the_food_store/controller/single_product_controller.dart';
import 'package:the_food_store/view/my-cart.dart';
import 'package:the_food_store/view_model/loading_with_logo.dart';
class SingleFood extends StatefulWidget {
  final String id;
  const SingleFood({Key? key, required this.id}) : super(key: key);

  @override
  State<SingleFood> createState() => _SingleFoodState();
}

class _SingleFoodState extends State<SingleFood> {

  SingleFoodController singleFoodController = Get.put(SingleFoodController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    singleFoodController.getSingleProduct(widget.id);
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body:Obx(()=> SingleChildScrollView(
            child: singleFoodController.isLoading.value ? loadingWithLogo(height: size.height, width: size.width)
                : Column(
              children: [
                Stack(
                  children: [
                    Container(
                      width: size.width,
                      height: size.height/2,
                      decoration: BoxDecoration(
                        color: AppTheme.yellow.withOpacity(0.2)
                      ),
                      padding: EdgeInsets.all(30),
                      child: Image.network("${AppConfig.PRODUCT_URL+singleFoodController.singleProductsList["image"]}"),
                    ),
                    Positioned(
                      top: 10,
                      left: 10,
                      child: IconButton(
                        onPressed: ()=>Get.back(),
                        icon: Icon(Icons.arrow_back_ios_new),
                        color: Colors.black54,
                      ),
                    ),

                    Positioned(
                      top: 10,
                      right: 10,
                      child: IconButton(
                        onPressed: ()=>Get.back(),
                        icon: Icon(Icons.favorite_border_outlined),
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),

                Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
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
                              Text("4.5",style: TextStyle(color: AppTheme.red),)

                            ],
                          ),
                          SizedBox(height: 10,),
                          Text("${singleFoodController.singleProductsList["name"]}",
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),



                        ],
                      ),

                      Text("৳ ${singleFoodController.singleProductsList["price"]}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp,

                        ),
                      ),

                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Description",
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(height: 5,),
                      Text("${singleFoodController.singleProductsList["description"]}",
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.black54,
                        ),
                      ),

                      SizedBox(height: 20,),
                      singleFoodController.isOpen.value ?
                      Container(
                        padding: EdgeInsets.all(10),
                        width: size.width,
                        decoration: BoxDecoration(
                          color: AppTheme.red.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Not available now",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12.sp,
                                color: AppTheme.red
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.watch_later_outlined, color: AppTheme.red,),
                                SizedBox(width: 5,),
                               RichText(
                                   text: TextSpan(
                                      children:[
                                        TextSpan(
                                          text: "Available:",
                                          style: TextStyle(
                                            color: AppTheme.red
                                          )
                                        ),
                                        TextSpan(
                                            text: "10:30 AM ",
                                            style: TextStyle(
                                                color: AppTheme.red,
                                              fontWeight: FontWeight.bold
                                            )
                                        ),
                                        TextSpan(
                                            text: "to ",
                                            style: TextStyle(
                                                color: AppTheme.red,
                                            )
                                        ),
                                        TextSpan(
                                            text: "10:30 PM ",
                                            style: TextStyle(
                                                color: AppTheme.red,
                                                fontWeight: FontWeight.bold
                                            )
                                        ),
                                      ],
                                   )
                                )
                              ],
                            ),
                          ],
                        ),
                      ):Center(),
                    ],
                  ),
                ),


              ],
            )
          ),
        ),
        bottomNavigationBar:Container(
          width: size.width,
          padding: EdgeInsets.only(left: 30, right: 30, bottom: 20, top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 100,
                child: Row(
                  children: [
                    buildCartCount(
                      onClick: (){},
                      icon: Icons.remove,
                        color: Colors.grey
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 7, right: 7),
                      child: Text(
                          "10",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 12.sp
                          )
                      ),
                    ),

                    buildCartCount(
                      color: AppTheme.red,
                      onClick: (){},
                      icon: Icons.add,
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: ()=>Get.to(MyCart(), transition: Transition.rightToLeft),
                child: Container(
                  padding: EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 20),
                  decoration: BoxDecoration(
                    color: AppTheme.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.add_shopping_cart, color: Colors.white,),
                      SizedBox(width: 5,),
                      Text("Add to Card",
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.white
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  InkWell buildCartCount({
  required VoidCallback onClick,
    required IconData icon,
    required Color color,
}) {
    return InkWell(
                    onTap:onClick,
                    child: Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(100)
                      ),
                      child: Center(
                        child: Icon(
                          icon,
                          color: Colors.white,
                        ),
                      ),

                    ),
                  );
  }
}
