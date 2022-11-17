import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'package:the_food_store/app_theme.dart';
import 'package:the_food_store/controller/product_controller.dart';
import 'package:the_food_store/view/profile.dart';
import 'package:the_food_store/view_model/home_populer_product.dart';
import 'favorite.dart';
import 'home-screen.dart';
import 'my-cart.dart';
import 'order-list.dart';

class AllFoods extends StatefulWidget {
  const AllFoods({Key? key}) : super(key: key);

  @override
  State<AllFoods> createState() => _AllFoodsState();
}

class _AllFoodsState extends State<AllFoods> {

  ProductController productController = Get.put(ProductController());

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
        title: Text("All Foods",
          style: TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.w600,
            fontSize: 13.sp
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  fillColor: AppTheme.white,
                  filled: true,
                  prefixIcon: Icon(
                    Icons.search
                  ),
                  suffixIcon: Icon(
                    Icons.filter_list
                  ),
                  hintText: "Search Foods",
                  contentPadding: EdgeInsets.only(left: 20, right: 20,),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none
                  )
                ),
              ),
              SizedBox(height: 30,),
              HomePopulerProduct(size: size),

            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: Icon(Icons.shopping_cart_rounded),
        onPressed: ()=>Get.to(MyCart(), transition: Transition.zoom),      ),
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
