import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_food_store/app_theme.dart';
import 'package:the_food_store/controller/user_profile_controller.dart';
import 'package:the_food_store/view/change-profile-info.dart';
import 'package:the_food_store/view/chat.dart';
import 'package:the_food_store/view/favorite.dart';
import 'home-screen.dart';
import 'my-cart.dart';
import 'order-list.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  UserProfileController userProfileController = Get.put(UserProfileController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppTheme.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: ()=>Get.back(),
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.black54,),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Obx(() =>Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("My Profile", style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.w900),),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Personal Info",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                      ),
                    ),

                    TextButton(
                      onPressed: ()=>Get.to(ChangeProfile(), transition: Transition.rightToLeft),
                      child: Text("Change",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp,
                          color: AppTheme.red
                        ),
                      ),
                    ),
                  ],
                ),

                //======= personal info box =========//
                userProfileController.isLoading.value ?  Container(
                  width: size.width,
                  padding: EdgeInsets.only(left: 10, right: 10, top: 30, bottom: 30),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Shimmer.fromColors(
                    baseColor: Colors.white,
                    highlightColor: Colors.grey.shade200,
                    child: Row(
                      children: [
                        Container(width: 120, height: 120, decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),color: Colors.white, ),),
                        SizedBox(width: 15,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(width: 120, height: 30, color: Colors.white,),
                            SizedBox(height: 5,),
                            Divider(height: 1, color: Colors.grey,),
                            SizedBox(height: 5,),
                            Container(width: 100, height: 30, color: Colors.white,),
                            SizedBox(height: 5,),
                            Divider(height: 1, color: Colors.grey,),
                            SizedBox(height: 5,),
                            Container(width: 50, height: 30, color: Colors.white,),
                          ],
                        )
                      ],
                    ),
                  ),
                )
                    : Container(
                  width: size.width,
                  padding: EdgeInsets.only(left: 10, right: 10, top: 30, bottom: 30),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      userProfileController.userProfileModel?.image != null ? Image.network("${userProfileController.userProfileModel?.image}",height: 100, width: 100,)
                          :Image.asset("assets/images/logo.png", height: 100, width: 100,),

                      SizedBox(width: 15,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${userProfileController.userProfileModel?.fName} ${userProfileController.userProfileModel?.lName}",
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700
                            ),
                          ),
                          SizedBox(height: 5,),
                          Divider(height: 1, color: Colors.grey,),
                          SizedBox(height: 5,),
                          Text("${userProfileController.userProfileModel?.email}",
                            style: TextStyle(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w400
                            ),
                          ),
                          SizedBox(height: 5,),
                          Divider(height: 1, color: Colors.grey,),
                          SizedBox(height: 5,),
                          Text("Points: ${userProfileController.userProfileModel?.point}",
                            style: TextStyle(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w700,
                              color: AppTheme.red
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),


                SizedBox(height: 20,),
                InkWell(
                  onTap: (){},
                  child: buildProfileListTile(size: size, title: "My Order", icon:  Icons.card_travel_sharp),
                ),
                InkWell(
                  onTap: (){},
                  child: buildProfileListTile(size: size, title: "Invite Friend", icon:  Icons.send),
                ),
                InkWell(
                  onTap: (){},
                  child: buildProfileListTile(size: size, title: "Set Delivery Address", icon:  Icons.location_on_outlined),
                ),
                InkWell(
                  onTap: ()=>Get.to(ChatPage(), transition: Transition.rightToLeft),
                  child: buildProfileListTile(size: size, title: "Messages", icon:  Icons.chat),
                ),
                InkWell(
                  onTap: (){},
                  child: buildProfileListTile(size: size, title: "Coupon", icon:  Icons.discount_rounded),
                ),
                InkWell(
                  onTap: (){},
                  child: buildProfileListTile(size: size, title: "Help & Support", icon:  Icons.support_agent),
                ),
                InkWell(
                  onTap: (){},
                  child: buildProfileListTile(size: size, title: "Privacy Policy", icon:  Icons.privacy_tip_rounded),
                ),
                InkWell(
                  onTap: (){},
                  child: buildProfileListTile(size: size, title: "Terms & Conditions", icon:  Icons.rule),
                ),
                InkWell(
                  onTap: (){},
                  child: buildProfileListTile(size: size, title: "About Us", icon:  Icons.info),
                )
              ],
            ),
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
                          color:  Colors.grey,
                        ),
                        Text(
                          'Favourite',
                          style: TextStyle(
                            color:Colors.grey,
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
                            color: currentTab == 2 ? Colors.blue : Colors.grey,
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
                          color: AppTheme.red,
                        ),
                        Text(
                          'Profile',
                          style: TextStyle(
                            color: AppTheme.red,
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

  Container buildProfileListTile(
  {
  required Size size, required String title, required IconData icon,
}
      ) {
    return Container(
                width: size.width,
                margin: EdgeInsets.only(bottom: 10),
                padding: EdgeInsets.only(left: 10, right: 10,),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: ListTile(
                  leading: Icon(icon, color: Colors.black54,),
                  title: Text("$title", style: TextStyle(fontWeight: FontWeight.w700,),),
                  trailing: Icon(Icons.arrow_forward_ios_outlined, color: Colors.black54,),
                ),
              );
  }
}
