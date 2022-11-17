import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'package:the_food_store/app_theme.dart';
import 'package:the_food_store/json.dart';
import 'package:the_food_store/view/profile.dart';
import 'package:the_food_store/view/single-food.dart';

import 'home-screen.dart';
import 'my-cart.dart';
import 'order-list.dart';

class Favorite extends StatefulWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: ()=>Get.back(),
          color: Colors.black54,
          icon: Icon(Icons.arrow_back_ios_new),
        ),
        title: Text("Favorite List",
          style: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.w600,
              fontSize: 13.sp
          ),
        ),
        actions: [
          Stack(
            children: [
              IconButton(
                onPressed: ()=>Get.back(),
                icon: Icon(Icons.shopping_cart),
                color: AppTheme.red,
              ),
              Positioned(
                  right: 12,
                  top: 5,
                  child: Container(
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: AppTheme.white,
                    ),
                    child: Center(
                      child: Text("10",
                        style: TextStyle(
                            color: AppTheme.red,
                            fontSize: 8.sp
                        ),
                      ),
                    ),
                  )
              ),
            ],
          )

        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: AppJson.comboPak.length,
          itemBuilder: (_, index){
            return Container(
              width: size.width,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    offset: Offset(0,2),
                    blurRadius: 10,
                    spreadRadius: 2
                  )
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: ()=>Get.to(SingleFood(id: "1",), transition: Transition.rightToLeft),
                   child: Row(
                     children: [
                       ClipRRect(
                         borderRadius: BorderRadius.circular(10),
                         child: Image.asset("${AppJson.comboPak[index]["image"]}", height: 70, width: 70, fit: BoxFit.cover,),
                       ),
                       SizedBox(width: 20,),
                       Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         mainAxisAlignment: MainAxisAlignment.start,
                         children: [
                           Text("${AppJson.comboPak[index]["name"]}",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 12.sp,
                              ),
                           ),
                           SizedBox(height: 5,),
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
                           Text("${AppJson.comboPak[index]["price"]}",
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                              color: AppTheme.red
                            ),
                           )
                         ],
                       ),
                     ],
                   ),
                 ),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: (){},
                        color: AppTheme.yellow,
                        icon: Icon(Icons.favorite),
                      ),
                      SizedBox(height: 10,),
                      InkWell(
                        onTap: (){},
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
            );
          },
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: Icon(Icons.shopping_cart_rounded),
        onPressed: ()=>Get.to(MyCart(), transition: Transition.zoom),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        Get.to(Home(), transition: Transition.rightToLeft);
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.home_filled,
                          color: Colors.grey,
                        ),
                        Text(
                          'Home',
                          style: TextStyle(
                            color:  Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        Get.to(Favorite(), transition: Transition.rightToLeft);
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.favorite,
                          color: AppTheme.red,
                        ),
                        Text(
                          'Favourite',
                          style: TextStyle(
                            color: AppTheme.red,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),

              // Right Tab bar icons

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        Get.to(OrderList(), transition: Transition.rightToLeft);
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.list_alt,
                          color: Colors.grey,
                        ),
                        Text(
                          'Order List',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        Get.to(Profile(), transition: Transition.rightToLeft);
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.person_outline,
                          color:  Colors.grey,
                        ),
                        Text(
                          'Profile',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )

            ],
          ),
        ),
      ),

    );
  }
  int currentTab = 0;
}
