import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:the_food_store/app_theme.dart';
import 'package:the_food_store/controller/auth_controller.dart';

import 'login.dart';

class SignUpEmail extends StatefulWidget {
  const SignUpEmail({Key? key}) : super(key: key);

  @override
  State<SignUpEmail> createState() => _SignUpEmailState();
}

class _SignUpEmailState extends State<SignUpEmail> {
AuthController authController = Get.put(AuthController());
  List<FocusNode> _focusNodes = [
    FocusNode(),
  ];
  final _cehckEmail = GlobalKey<FormState>();

  final email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Email", style: TextStyle(color: Colors.blueGrey),),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          onPressed: (){
            Get.back();
            print("click");
          },
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.grey,),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Obx(()=> Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/logo.png", height: 100, width: 100,),
                  Text("THE FOOD \nSTORE",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w800
                    ),
                  )
                ],
              ),

              SizedBox(height: 70,),
              Text("Create account",
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
              ),
              SizedBox(height: 5,),
              Text("Create a new accout with Email",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
              ),

              SizedBox(height: 20,),
              Form(
                key: _cehckEmail,
                child: Container(
                  padding: EdgeInsets.only(left: 8, right: 8, top: 18, bottom: 8),
                  decoration:
                  BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: _focusNodes[0].hasFocus ? Colors.grey.shade200 : Colors.transparent,
                        blurRadius: 10,
                        spreadRadius: 2,
                        offset: Offset(0,3),
                      )
                    ],

                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: email,
                        focusNode: _focusNodes[0],
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppTheme.red
                        ),
                        //  obscureText: !_passwordVisible,
                        decoration: InputDecoration(
                            label: Text("Email"),
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 10.sp,
                                color: Colors.grey
                            ),
                            hintText:"Email",
                            prefixIcon: Icon(
                              Icons.email,
                              color: _focusNodes[0].hasFocus ? AppTheme.red : Colors.grey,
                            ),
                            prefixIconColor: AppTheme.red,
                            contentPadding: EdgeInsets.only(left: 20, right: 20),
                            border: OutlineInputBorder(borderSide: BorderSide.none),
                            hintStyle: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w200
                            )
                        ),
                        validator: (value){
                          if(value!.isEmpty ){
                            return "Email must not be empty";
                          }
                          return null;
                        },
                      ),


                    ],
                  ),
                ),
              ),
              SizedBox(height: 5,),
                authController.isCheckEmailerror.value? Row(
                  children: [
                    Icon(Icons.error,color: AppTheme.red,),
                    SizedBox(width: 5,),
                    Text("${authController.checkImageItems["errors"][0]["message"]}",
                      style: TextStyle(
                          fontSize: 13,
                          color: AppTheme.red
                      ),
                    ),
                  ],
                ) : Center(),

              SizedBox(height: 20,),
              InkWell(
                onTap: (){
                  if(_cehckEmail.currentState!.validate()){
                    authController.checkEmail(email.text);
                  }
                },
                child: Container(
                  width: size.width,
                  padding: EdgeInsets.only(left: 30, right: 30, top: 15, bottom: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppTheme.red,
                  ),
                  child: authController.isCheckEmail.value ? Container(
                      height:20,
                      child: Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: AppTheme.white,
                        ),
                      )
                  ):Text(
                    "Create account",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: AppTheme.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
