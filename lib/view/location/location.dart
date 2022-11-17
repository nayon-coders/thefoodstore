import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:the_food_store/app_theme.dart';
import 'package:the_food_store/view/location/location-map.dart';
class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size; 
    return Scaffold(
      backgroundColor: AppTheme.yellow,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
         Align(
           alignment: Alignment.center,
           child: Container(
             margin: EdgeInsets.only(top: 60, bottom: 20),
             child: Column(
               children: [
                 ClipRRect(
                   borderRadius: BorderRadius.circular(100),
                   child: Image.asset("assets/images/logo.png", height: 80, width: 80, fit: BoxFit.cover,),
                 ),
                SizedBox(height: 10,),
                 Text("THE FOOD STORE",
                   style: TextStyle(
                       color: Colors.white,
                     fontWeight: FontWeight.bold,
                     fontSize: 14.sp
                   ),
                 )
               ],
             ),
           ),
         ),
          Expanded(
            child: Container(
              height: size.height,
              padding: EdgeInsets.only(left: 30,top: 30, bottom: 20, right: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  )
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    //========== title ==============//
                    Row(
                      children: [
                        IconButton(
                          onPressed: ()=>Get.back(),
                          icon: Icon(Icons.arrow_back_ios_new,),
                        ),
                        SizedBox(width: 10,),
                        Text("Deliver to",
                          style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.black
                          ),
                        ),

                      ],
                    ),
                    //========== Title ============//

                    SizedBox(height: 20,),

                    //============ search ==========//
                    TextFormField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          hintText: "Search Location",
                          filled: true,
                          fillColor: AppTheme.white,
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          contentPadding: EdgeInsets.only(left: 20, right: 10)
                      ),
                    ),
                    //============ search ==========//

                    SizedBox(height: 20,),

                    //============ list of search ============//
                    GestureDetector(
                      onTap: ()=>Get.to(LocationMap(), transition: Transition.rightToLeft, duration: Duration(milliseconds: 300)),
                      child: ListTile(
                        leading: Icon(Icons.location_on_outlined, color: Colors.black54, size: 26.sp,),
                        title: Text("Current Location" , style: TextStyle(fontWeight: FontWeight.bold),),
                        subtitle: Text("21-42-34, Banjara Hills, Hyderabad, 500072"),
                      ),
                    ),
                    SizedBox(height: 20,),
                    GestureDetector(
                      onTap: (){},
                      child: ListTile(
                        leading: Icon(Icons.map, color: Colors.black54, size: 26.sp, ),
                        title: Text("Look up the map" , style: TextStyle(fontWeight: FontWeight.bold),),
                        subtitle: Text("Search form map"),
                      ),
                    ),

                    //============ list of search ============//


                  ],
                ),
              ),
            )
          )

        ],
      ),
    );
  }
}
