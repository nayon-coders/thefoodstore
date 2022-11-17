import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import 'package:the_food_store/app_theme.dart';
import 'package:the_food_store/view/location/order-tracking.dart';
import 'package:the_food_store/view/my-cart.dart';
import 'package:the_food_store/view/profile.dart';

import 'favorite.dart';
import 'home-screen.dart';

class OrderList extends StatefulWidget {
  const OrderList({Key? key}) : super(key: key);

  @override
  State<OrderList> createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: ()=>Get.back(),
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.black54,),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Order List",
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.black
              ),
            ),
            SizedBox(height: 20,),
            
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (_, index){
                  return Card(
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 50,
                                    height: 50,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset("assets/images/f1.png"),
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Chicken Burger",
                                        style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.black
                                        ),
                                      ),
                                      Text("20 Nov 2022",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.black54
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              Text("\$25",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                  fontWeight: FontWeight.bold
                                ),
                              )
                            ],


                          ),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text("ITEMS",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black54
                                    ),
                                  ),
                                  Text("1 X Chicken Burger",
                                    style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.black
                                    ),
                                  )
                                ],
                              ),
                              Center(),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Divider(height: 2, color: Colors.grey,),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 100,
                                height: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.blue.shade100,
                                ),
                                child: Center(
                                  child: Text("Pending",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.blue
                                    ),
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: ()=>Get.to(OrderTracking(), transition: Transition.rightToLeft),
                                child: Container(
                                  width: 100,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppTheme.red.withOpacity(0.2),
                                  ),
                                  child: Center(
                                    child: Text("Track Order",
                                      style: TextStyle(
                                        color: AppTheme.red
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            )

          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: Icon(Icons.shopping_cart_rounded),
        onPressed: ()=>Get.to(MyCart(), transition: Transition.zoom),
      ),
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
                        Get.to(Favorite(), transition: Transition.rightToLeft);
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.favorite,
                          color: Colors.grey,
                        ),
                        Text(
                          'Favourite',
                          style: TextStyle(
                            color: Colors.grey,
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
                          color: AppTheme.red,
                        ),
                        Text(
                          'Order List',
                          style: TextStyle(
                            color: AppTheme.red,
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
                          color: Colors.grey,
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
