import 'package:clipboard/clipboard.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_food_store/view/check-out.dart';

import '../app_theme.dart';
import '../json.dart';


class MyCart extends StatefulWidget {
  const MyCart({Key? key}) : super(key: key);

  @override
  State<MyCart> createState() => _MyCartState();
}
enum SingingCharacter { lafayette, jefferson }

class _MyCartState extends State<MyCart> {

// ...

  SingingCharacter? _character = SingingCharacter.lafayette;


  double carItemHeight = 110;
  double cartItem = AppJson.cart.length.toDouble();
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
        title: Text("My Cart List",
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
              SizedBox(
                width: size.width,
                height: carItemHeight*cartItem,
                child: ListView.builder(
                  itemCount: AppJson.cart.length,
                  itemBuilder: (_, index){
                    return Container(
                      width: size.width,
                      //height: carItemHeight,
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.only(bottom: 10),
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
                          //  onTap: ()=>Get.to(SingleFood(), transition: Transition.rightToLeft),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset("${AppJson.cart[index]["image"]}", height: 60, width: 60, fit: BoxFit.cover,),
                                ),
                                SizedBox(width: 20,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width:size.width/1.9,
                                          child: Text("${AppJson.cart[index]["name"]}",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12.sp,
                                            ),
                                          ),
                                        ),


                                       Align(
                                         alignment:Alignment.bottomRight,
                                         child: Icon(
                                           Icons.delete_outline,
                                           size: 20.sp,
                                           color: AppTheme.red,
                                         ),
                                       )
                                      ],
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
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width:size.width/2.3,
                                          child: Text("${AppJson.comboPak[index]["price"]}",
                                            style: TextStyle(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.bold,
                                                color: AppTheme.red
                                            ),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            buildCartCount(
                                                onClick: (){},
                                                icon: Icons.remove,
                                                color: Colors.grey
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(left: 7, right: 7),
                                              child: Text(
                                                  "10",
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.w600,
                                                      fontSize: 12.sp
                                                  )
                                              ),
                                            ),

                                            buildCartCount(
                                              color: AppTheme.red,
                                              onClick: (){},
                                              icon: Icons.add,
                                            )
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),



                        ],
                      ),
                    );
                  },
                ),
              ),

              SizedBox(height: 20,),
              InkWell(
                onTap: ()=>showCouponList(size),
                child: DottedBorder(
                  color: AppTheme.red,
                  strokeWidth: 1,
                  dashPattern:[4,6],
                  child: Container(
                    width: size.width,
                    decoration: BoxDecoration(
                      color: AppTheme.red.withOpacity(0.2)
                    ),
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:  [
                            Text("Use coupon, get bonus. ",
                              style: TextStyle(
                                color: AppTheme.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 15.sp
                              ),
                            ),
                            SizedBox(height: 7,),
                            Text("Tap here to see all coupon and enjoy it. ",
                              style: TextStyle(
                                color: AppTheme.grey,
                                fontSize: 10.sp
                              ),
                            )
                          ],
                        ),

                        Lottie.asset("assets/images/coupon.json",
                          repeat: true,
                          width: 70,
                          height: 70
                        )
                      ],
                    ),
                  ),
                ),
              ),



              SizedBox(height: 30,),
              Text("Delivery Options",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 14.sp,
                ),
              ),

              Column(
                children: <Widget>[
                  ListTile(
                    title: const Text('Home Delivery'),
                    leading: Radio<SingingCharacter>(
                      value: SingingCharacter.lafayette,
                      groupValue: _character,
                      onChanged: (SingingCharacter? value) {
                        setState(() { _character = value; });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('Pick up (Free)'),
                    leading: Radio<SingingCharacter>(
                      value: SingingCharacter.jefferson,
                      groupValue: _character,
                      onChanged: (SingingCharacter? value) {
                        setState(() { _character = value; });
                      },
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20,),
              checkoutAccounting(name: "Item Price", amount: "(+) ৳ 950.56"),
              SizedBox(height: 5,),
              checkoutAccounting(name: "Vat/Tes", amount: "(+) ৳ 50.56"),

              SizedBox(height: 5,),
              checkoutAccounting(name: "Addons", amount: "(+) ৳ 00.00"),
              SizedBox(height: 5,),
              DottedBorder( child: Center(), padding: EdgeInsets.all(0), dashPattern: [4,4]),
              SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Sub total", style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w900),),
                  Text("(+) ৳ 1000.90", style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w900),),
                ],
              ),
              SizedBox(height: 5,),
              checkoutAccounting(name: "Discount", amount: "(-) ৳ 0.00"),
              SizedBox(height: 5,),
              checkoutAccounting(name: "Coupon Discount", amount: "(-) ৳ 0.00"),
              SizedBox(height: 5,),
              DottedBorder( child: Center(), padding: EdgeInsets.all(0), dashPattern: [4,4]),
              SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total total", style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w900, color: AppTheme.red),),
                  Text("(+) ৳ 1000.90", style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w900),),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(left: 50, bottom: 30, right: 50, top: 10),
        child: InkWell(
          onTap: ()=>Get.to(CheckOut(), transition: Transition.rightToLeft),
          child: Container(
            height: 60,
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: AppTheme.red,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Text("Place Order",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: AppTheme.white,
                  fontSize: 15.sp
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row checkoutAccounting({required String name, required String amount}) {
    return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("$name"),
                Text("$amount", style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w900),),
              ],
            );
  }


  InkWell buildCartCount({
    required VoidCallback onClick,
    required IconData icon,
    required Color color,
  }) {
    return InkWell(
      onTap:onClick,
      child: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(100)
        ),
        child: Center(
          child: Icon(
            icon,
            color: Colors.white,
            size: 12.sp,
          ),
        ),

      ),
    );
  }

  showCouponList(Size size) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: size.height/1.2,
            child: ListView.builder(
              itemCount: AppJson.couponList.length,
              itemBuilder: (_, index){
                return Container(
                  margin: EdgeInsets.only(left:30, right:30, top: 20),
                  padding: EdgeInsets.only(left: 20, right: 50, top: 10, bottom: 10),
                  width: size.width,
                  height: 90,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/cupon.png"),
                      fit: BoxFit.cover
                    )
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(text: "${AppJson.couponList[index]["percent"]} ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      color: AppTheme.red,
                                      fontSize: 20.sp
                                    )
                                  ),
                                  TextSpan(text: "OFF ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: AppTheme.black,
                                          fontSize: 15.sp
                                      )
                                  )
                                ],
                              )),

                          SizedBox(height: 7,),
                          Text("${AppJson.couponList[index]["name"]} ",
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: AppTheme.black,
                            ),
                          ),
                        ],
                      ),

                      InkWell(
                        onTap: (){
                          Navigator.pop(context);//
                          FlutterClipboard.paste().then((value) {

                            Fluttertoast.showToast(
                                msg: "This is Center Short Toast",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0
                            );
                          });

                        },
                        child: Container(
                          padding: EdgeInsets.only(left: 30, right: 30, top: 15, bottom: 15),
                          decoration: BoxDecoration(
                            color: AppTheme.red.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Text("Copy Code"),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          );
        });
  }
}
