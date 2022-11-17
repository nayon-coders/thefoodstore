import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';
import 'package:the_food_store/app_confige.dart';
import 'package:the_food_store/app_theme.dart';
import 'package:the_food_store/controller/banner_controller.dart';
import 'package:the_food_store/main.dart';
import 'package:the_food_store/json.dart';
import 'package:the_food_store/model/foods.dart';
import 'package:the_food_store/view/all-combo-foods.dart';
import 'package:the_food_store/view/all-foods.dart';
import 'package:the_food_store/view/all-resturent.dart';
import 'package:the_food_store/view/favorite.dart';
import 'package:the_food_store/view/profile.dart';
import 'package:the_food_store/view/single-food.dart';
import 'package:the_food_store/view/single-resturent.dart';

import '../controller/local_database_controller.dart';
import '../view_model/grider-foods-list.dart';
import '../view_model/home_cateogry.dart';
import '../view_model/home_populer_product.dart';
import '../view_model/loading_with_logo.dart';
import 'my-cart.dart';
import 'order-list.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Local database
  LocalDB localDB = Get.put(LocalDB());

  int _current = 0;
  List slider = [
    "assets/images/slider1.jpeg",
    "assets/images/slider2.jpeg",
    "assets/images/slider3.jpeg",
  ];
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Container(
          margin: EdgeInsets.only(left: 10, top: 10, bottom: 5),
          width: 30,
          height: 30,
          padding: EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: Color(0xfff1f1f1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(Icons.dashboard, color: AppTheme.red, size: 20.sp,),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.location_on_outlined, color: AppTheme.red,  size: 15.sp,),
            SizedBox(
              width: 200,
              child: localDB.isLoading.value ? Shimmer.fromColors(
                  child: Container(
                    width: 200, color: Colors.white,),
                  baseColor: Colors.white, highlightColor: Colors.grey.shade200)
                  :Text("${localDB.address}",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.blueGrey,
                  fontSize: 12.sp,
                ),
              ),
            )
          ],
        ),
        //centerTitle: true,
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10, top: 10, bottom: 5),
            width: 45,
            height: 45,
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: Color(0xfff1f1f1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset("assets/images/profile.png",)
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Stack(
                children: [
                  GetBuilder<BannerController>(
                    init: BannerController(),
                    builder: (bannerController) {

                      return bannerController.isLoading.value != true? CarouselSlider.builder(
                          itemCount: bannerController.bannerModel?.length,
                          itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) => Column(
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network("${AppConfig.BANNER_BASE_URL+bannerController.bannerModel[itemIndex]["image"]}", height: 148,  width: size.width, fit: BoxFit.cover,)
                              ),
                            ],
                          ),
                          options: CarouselOptions(
                            onPageChanged: (index, reason) {
                              setState(() {
                                _current = index;
                              });
                            },
                            height: 172,
                            aspectRatio: 16/9,
                            viewportFraction: 1,
                            initialPage: 0,
                            enableInfiniteScroll: true,
                            reverse: false,
                            autoPlay: true,
                            autoPlayInterval: Duration(seconds: 3),
                            autoPlayAnimationDuration: Duration(milliseconds: 800),
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enlargeCenterPage: true,
                            scrollDirection: Axis.horizontal,
                          )
                      ):loadingWithLogo(height: 150, width: size.width,);


                    }
                  ),
                  Positioned(
                    bottom: 35,
                    left: size.width/3,
                    right: size.width/3,
                    child: Align(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: slider.asMap().entries.map((entry) {
                          return GestureDetector(
                            onTap: () => _controller.animateToPage(entry.key),
                            child: Container(
                              width: 12.0,
                              height: 12.0,
                              margin: EdgeInsets.symmetric(horizontal: 4.0),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: (Theme.of(context).brightness == Brightness.dark
                                      ? AppTheme.red
                                      : AppTheme.red)
                                      .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
            ),
              SizedBox(height: 5,),
              homeCategory(size: size),
              SizedBox(height: 30,),

              //Most puller restaurant
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Most Popular Restaurants",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 13.sp,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 5,),
                      Text("Near by you",
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 11.sp,
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),

                  TextButton(
                      onPressed: ()=>Get.to(AllRestaurants(), transition: Transition.rightToLeft),
                      child: Text("SEE ALL",
                        style: TextStyle(
                          color: AppTheme.red,
                          fontSize: 12.sp
                        ),
                      )
                  )
                ],
              ),

              SizedBox(height: 20,),
              Container(
                height: 160,
                width: size.width,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: AppJson.resturentList.length,
                    itemBuilder: (_, index){
                      return InkWell(
                        onTap: ()=>Get.to(SingleResturent(), transition: Transition.rightToLeft),
                        child: Container(
                          width: 200,
                          margin: EdgeInsets.only(right: 20),
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
                                          overflow: TextOverflow.ellipsis,
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
                    }
                ),
              ),

              SizedBox(height: 30,),
              Container(
                width: size.width,
                height: 120,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset("assets/images/slider3.jpeg", fit: BoxFit.cover,),
                ),
              ),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Combo Offer ",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 13.sp,
                      color: Colors.black,
                    ),
                  ),

                  TextButton(
                      onPressed: ()=>Get.to(AllComboFoods(), transition: Transition.rightToLeft),
                      child: Text("SEE ALL",
                        style: TextStyle(
                            color: AppTheme.red,
                            fontSize: 12.sp
                        ),
                      )
                  )
                ],
              ),
              Container(
                width: size.width,
                height: 240,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: AppJson.comboPak.length,
                  itemBuilder: (_, index){
                    return Foods(
                        width: 180,
                        height: 220,
                        name: AppJson.comboPak[index]["name"].toString(),
                        price: AppJson.comboPak[index]["price"].toString(),
                        image: Image.asset("${AppJson.comboPak[index]['image']}", height: 100, width: 100, fit: BoxFit.cover,),
                        icon: Icons.add,
                        onClick: (){
                          print(index);
                        },
                    );
                  },
                )
              ),
              SizedBox(height: 15,),


              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Most Popular ",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 13.sp,
                      color: Colors.black,
                    ),
                  ),

                  TextButton(
                      onPressed: ()=>Get.to(AllFoods(), transition: Transition.rightToLeft),
                      child: Text("SEE ALL",
                        style: TextStyle(
                            color: AppTheme.red,
                            fontSize: 12.sp
                        ),
                      )
                  )
                ],
              ),
              HomePopulerProduct(size: size),
              SizedBox(height: 30,),






            ],
          ),
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
                          color: AppTheme.red,
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
                          color:Colors.grey,
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
                        currentTab = 2;
                      });
                      Get.to(OrderList(), transition: Transition.rightToLeft);
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




