import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';

import '../app_theme.dart';

class SingleResturent extends StatefulWidget {
  const SingleResturent({Key? key}) : super(key: key);

  @override
  State<SingleResturent> createState() => _SingleResturentState();
}

class _SingleResturentState extends State<SingleResturent> {
  List daySelected = [
    {
      "id" : 0,
      "name" : "Category1"
    }
  ];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
     body: SingleChildScrollView(
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Container(
             width: size.width,
             height: 300,
             decoration: BoxDecoration(
               image: DecorationImage(
                 image: AssetImage("assets/images/r1.jpeg"),
                 fit: BoxFit.cover
               )
             ),
             child: Stack(
               children: [
                 //============== Color Shadow ================//
                 Container(
                   width: size.width,
                   height: 300,
                   decoration: BoxDecoration(
                     color: Colors.black.withOpacity(0.5)
                   ),
                 ),

                 //============== Arrow back ================//
                 Positioned(
                   top: 30,
                   left: 10,
                   child: IconButton(
                     onPressed: ()=>Get.back(),
                     icon: Icon(Icons.arrow_back_ios_new),
                     color: Colors.white,
                   ),
                 ),

                 //============== cart icon ================//
                 Positioned(
                   top: 30,
                   right: 10,
                   child: IconButton(
                     onPressed: ()=>Get.back(),
                     icon: Icon(Icons.shopping_cart),
                     color: Colors.white,
                   ),
                 ),
                 //============== cart count ================//
                 Positioned(
                   top: 35,
                   right: 20,
                   child: Container(
                     width: 15,
                     height: 15,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(100),
                       color: Colors.red,
                     ),
                     child: Center(
                       child: Text("10",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 8.sp
                          ),
                        ),
                     ),
                   )
                 ),


                 //============= Logo with name ===================//
                 Positioned(
                   bottom: 20,
                   left: 20,
                   child: Row(
                     children: [
                       ClipRRect(
                         borderRadius: BorderRadius.circular(100),
                         child: Image.network("https://www.logolynx.com/images/logolynx/2e/2e8a5e367570aa8cc83cf228e7da309b.jpeg",
                          height: 70,
                           width: 70,
                         ),
                       ),
                       SizedBox(width: 10,),

                       Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text("Fresh Foods",
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.white
                            ),
                           ),
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
                               Text("4.5",style: TextStyle(color: AppTheme.white),),
                             ],
                           ),
                           SizedBox(height: 5,),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.start,
                             children: [
                               Icon(Icons.watch_later_outlined, color: AppTheme.white, size: 15.sp,),
                               SizedBox(width: 5,),
                               RichText(
                                   text: TextSpan(
                                     children:[
                                       TextSpan(
                                           text: "Open:",
                                           style: TextStyle(
                                               color: AppTheme.white
                                           )
                                       ),
                                       TextSpan(
                                           text: "10:30 AM ",
                                           style: TextStyle(
                                               color: AppTheme.white,
                                               fontWeight: FontWeight.bold
                                           )
                                       ),
                                       TextSpan(
                                           text: "to ",
                                           style: TextStyle(
                                             color: AppTheme.white,
                                           )
                                       ),
                                       TextSpan(
                                           text: "10:30 PM ",
                                           style: TextStyle(
                                               color: AppTheme.white,
                                               fontWeight: FontWeight.bold
                                           )
                                       ),
                                     ],
                                   )
                               )
                             ],
                           ),
                         ],
                       )
                     ],
                   ),
                 ),

               ],
             ),
           ),

           SizedBox(height: 20,),
           Padding(
             padding: const EdgeInsets.only(left: 20, right: 20),
             child: Text("Category List",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600
              ),
             ),
           ),
           SizedBox(height: 10,),
           Container(
             width: size.width,
             height: 50,
             margin: EdgeInsets.only(left: 20),
             child: ListView.builder(
               scrollDirection: Axis.horizontal,
               itemCount: 10,
               itemBuilder: (_, index){
                 return InkWell(
                   onTap: (){
                     setState(() {
                       daySelected.clear();
                       daySelected.add({
                         "id" : index,
                         "name" :  "Category$index",
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
                       border: Border.all(width: 1, color: AppTheme.red)
                     ),
                     child: Center(child: Text("Category$index", style: TextStyle(color:  daySelected.isNotEmpty && daySelected[0]["id"] == index ? Colors.white: AppTheme.red),)),
                   ),
                 );
               },
             ),
           ),
           SizedBox(height: 20,),
           Padding(
             padding: const EdgeInsets.only(left: 20, right: 20),
             child: Text("ALL",
               style: TextStyle(
                   fontSize: 15,
                   fontWeight: FontWeight.w700
               ),
             ),
           ),

           Padding(
             padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
             child: Center(
               child: Text("Product show when API is Call",
                 style: TextStyle(
                     fontSize: 15,
                     fontWeight: FontWeight.w700
                 ),
               ),
             ),
           ),



         ],
       ),
     )
    );
  }
}
