import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'package:the_food_store/json.dart';
import 'package:the_food_store/view/location/location-map.dart';
import 'package:the_food_store/view/profile.dart';

import '../app_theme.dart';
import 'favorite.dart';
import 'home-screen.dart';
import 'order-list.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({Key? key}) : super(key: key);

  @override
  State<CheckOut> createState() => _CheckOutState();
}
enum SingingCharacter { lafayette, jefferson }


class _CheckOutState extends State<CheckOut> {
  SingingCharacter? _character = SingingCharacter.lafayette;


  List daySelected = [{
    "id" : 0,
    "name" :  AppJson.day[0],
  }];
  List timeSelected = [{
    "id" : 0,
    "name" :  AppJson.todayTime[0],
  }];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: ()=>Get.back(),
          color: Colors.black54,
          icon: Icon(Icons.arrow_back_ios_new),
        ),
        title: Text("CheckOut",
          style: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.w600,
              fontSize: 13.sp
          ),
        ),

      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DottedBorder(
                color: AppTheme.red,
                strokeWidth: 1,
                dashPattern:[4,6],
                child: Container(
                  width: size.width,
                  decoration: BoxDecoration(
                      color: AppTheme.red.withOpacity(0.2)
                  ),
                  padding: EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:  [
                          Text("Delivery Location",
                            style: TextStyle(
                                color: AppTheme.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 15.sp
                            ),
                          ),
                          SizedBox(height: 7,),
                          Text("Dhanmodi 15, jigatola, Dhaka",
                            style: TextStyle(
                                color: AppTheme.grey,
                                fontSize: 10.sp
                            ),
                          )
                        ],
                      ),

                     InkWell(
                       onTap: ()=>Get.to(LocationMap(), transition: Transition.rightToLeft),
                       child: Container(
                         padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(100),
                           color: Colors.white
                         ),
                         child: Text("Change Location",
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: AppTheme.red
                          ),
                         ),
                       ),
                     )
                    ],
                  ),
                ),
              ),

              SizedBox(height: 30,),
              Text("Preference Time",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w900
                ),
              ),

              //======== day=========//
              SizedBox(height: 10,),
              Container(
                width: size.width,
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: AppJson.day.length,
                  itemBuilder: (_, index){
                    return InkWell(
                      onTap: (){
                        setState(() {
                          daySelected.clear();
                          daySelected.add({
                            "id" : index,
                            "name" :  AppJson.day[index],
                          });
                          print(daySelected[0]);
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 10),
                        padding: EdgeInsets.only(left: 20, right: 20),
                        decoration: BoxDecoration(
                          color: daySelected.isNotEmpty && daySelected[0]["id"] == index ? AppTheme.red : Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(child: Text("${AppJson.day[index]}", style: TextStyle(color:  daySelected.isNotEmpty && daySelected[0]["id"] == index ? Colors.white: Colors.black54),)),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 10,),
              Container(
                width: size.width,
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: AppJson.todayTime.length,
                  itemBuilder: (_, index){
                    return InkWell(
                      onTap: (){
                        setState(() {
                          timeSelected.clear();
                          timeSelected.add({
                            "id" : index,
                            "name" :  AppJson.todayTime[index],
                          });
                          print(timeSelected[0]);
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 10),
                        padding: EdgeInsets.only(left: 20, right: 20),
                        decoration: BoxDecoration(
                          color: timeSelected.isNotEmpty && timeSelected[0]["id"] == index ? AppTheme.red : Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(child: Text("${AppJson.todayTime[index]}", style: TextStyle(color:  timeSelected.isNotEmpty && timeSelected[0]["id"] == index ? Colors.white: Colors.black54),)),
                      ),
                    );
                  },
                ),
              ),

              SizedBox(height: 30,),
              Text("Payment Method",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 14.sp,
                ),
              ),

              Column(
                children: <Widget>[
                  ListTile(
                    title: const Text('Cash On Delivery'),
                    leading: Radio<SingingCharacter>(
                      activeColor: AppTheme.red,
                      value: SingingCharacter.lafayette,
                      groupValue: _character,
                      onChanged: (SingingCharacter? value) {
                        setState(() { _character = value; });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('Digital Payment'),
                    leading: Radio<SingingCharacter>(
                      activeColor: AppTheme.red,
                      value: SingingCharacter.jefferson,
                      groupValue: _character,
                      onChanged: (SingingCharacter? value) {
                        setState(() { _character = value; });
                      },
                    ),
                  ),
                ],
              ),

              //======= aditional note =========//
              TextFormField(
                maxLines: 3,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none
                  ),
                  hintText: "Additional Notes",
                  filled: true,
                  fillColor: Colors.white
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: Icon(Icons.shopping_cart_rounded),
        onPressed: () {},
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
