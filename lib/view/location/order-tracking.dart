import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:the_food_store/app_theme.dart';

import '../../view_model/status.dart';
import '../favorite.dart';
import '../home-screen.dart';
import '../my-cart.dart';
import '../order-list.dart';
import '../profile.dart';

class OrderTracking extends StatefulWidget {
  const OrderTracking({Key? key}) : super(key: key);

  @override
  State<OrderTracking> createState() => _OrderTrackingState();
}

class _OrderTrackingState extends State<OrderTracking> {
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:  EdgeInsets.only(left: 20, right: 20),
              child: Text("Order Tracking",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.black
                ),
              ),
            ),
            SizedBox(height: 20,),


             Card(
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Column(
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

                  ],
                ),
              ],
            ),
          ),
        ),
            SizedBox(height: 20,),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                   width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppTheme.red.withOpacity(0.2),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Order ID",
                          style: TextStyle(
                            fontSize: 15,
                            color: AppTheme.black,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                        Text("#7475DFE43",
                          style: TextStyle(
                              fontSize: 17,
                              color: AppTheme.red,
                              fontWeight: FontWeight.w400
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                    width: 170,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppTheme.red.withOpacity(0.2),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Total Amount",
                          style: TextStyle(
                              fontSize: 15,
                              color: AppTheme.black,
                              fontWeight: FontWeight.w600
                          ),
                        ),
                        Text("\$25",
                          style: TextStyle(
                              fontSize: 18,
                              color: AppTheme.red,
                              fontWeight: FontWeight.w400
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Preparing Food",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                            color: Colors.black
                          ),
                        ),
                        SizedBox(height: 5,),
                        Text("Time: 45 min",
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 12,
                              color: Colors.black
                          ),
                        )
                      ],
                    ),

                    Lottie.asset("assets/images/food-prepaar.json",
                        repeat: true,
                        width: 70,
                        height: 70
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30,),
            Padding(
              padding: EdgeInsets.only(left: 30,right:30),
              child: Column( 
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,

                children:[
                  Text("Order Status: ",
                  style:TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                  )
                  ),
                  SizedBox(height: 20,),
                  //HorizontalExample(),
                  buildStatus( "Order Accepted", Colors.green,),
                  SizedBox(height: 15,),
                  buildStatus( "Preparing Food", Colors.amber,),
                  SizedBox(height: 15,),
                  buildStatus('Shipped ', Colors.grey),
                  SizedBox(height: 15,),
                  buildStatus('Out for delivery ', Colors.grey),
                  SizedBox(height: 15,),
                  buildStatus('Delivered ', Colors.grey),
                  SizedBox(height: 40,),
                ],
              )
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

  Row buildStatus(String title, Color color) {
    return Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        border: Border.all(width: 3, color: color),
                        borderRadius: BorderRadius.circular(100)
                      ),
                      child: Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: color,
                        )
                      )
                    ),
                    SizedBox(width: 7,),
                    Text("$title",
                      style:TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: color
                      )
                    )
                  ],
                );
  }
  int currentTab = 0;
}
