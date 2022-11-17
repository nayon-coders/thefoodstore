import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:the_food_store/view/profile.dart';
import 'package:the_food_store/view/single-resturent.dart';

import '../app_theme.dart';
import '../json.dart';
import 'favorite.dart';
import 'home-screen.dart';
import 'my-cart.dart';
import 'order-list.dart';

class AllRestaurants extends StatefulWidget {
  const AllRestaurants({Key? key}) : super(key: key);

  @override
  State<AllRestaurants> createState() => _AllRestaurantsState();
}

class _AllRestaurantsState extends State<AllRestaurants> {
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
        title: Text("All Restaurants",
          style: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.w600,
              fontSize: 13.sp
          ),
        ),
      ),
      body: Container(
        width: size.width,
        padding: EdgeInsets.all(10),

        child: GridView.builder(
         //   physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              mainAxisExtent: 200,
            ),
            itemCount: AppJson.resturentList.length,
            itemBuilder: (BuildContext ctx, index) {
              return InkWell(
                onTap: ()=>Get.to(SingleResturent(), transition: Transition.rightToLeft),
                child: Container(
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(AppJson.resturentList[index]["image"].toString(),),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        bottom:10,
                        right: 10,
                        left: 10,
                        child: Container(
                          height:50,
                          width: 170,
                          padding: EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
                          //margin: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white.withOpacity(0.7),
                          ),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.network(AppJson.resturentList[index]["logo"].toString(),
                                  height: 40,
                                  width: 40,
                                  fit: BoxFit.cover,
                                ),

                              ),
                              SizedBox(width: 8,),
                              Flexible(
                                child: Text(AppJson.resturentList[index]["name"].toString(),
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }),


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
