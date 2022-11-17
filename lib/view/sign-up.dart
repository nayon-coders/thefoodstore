import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'package:the_food_store/controller/auth_controller.dart';
import 'package:the_food_store/view/home-screen.dart';
import 'package:the_food_store/view/login.dart';
import 'package:the_food_store/view/profile.dart';

import '../app_theme.dart';
import 'favorite.dart';

class SignUp extends StatefulWidget {
  final String email;
  const SignUp({Key? key, required this.email}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  AuthController authController = Get.put(AuthController());
  List<FocusNode> _focusNodes = [
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
  ];
  late bool _passwordVisible;
  final _signupKey = GlobalKey<FormState>();
  final _Fname = TextEditingController();
  final _Lname = TextEditingController();
  final _number = TextEditingController();
  final _pass = TextEditingController();
  final _Cpass = TextEditingController();
  final _referCode = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    _passwordVisible = false;
    _focusNodes.forEach((node) {
      node.addListener(() {
        setState(() {
        });
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Create an account", style: TextStyle(color: Colors.blueGrey),),
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
        child: Obx(()=>Padding(
          padding: EdgeInsets.all(20),
          child: Form(
            key: _signupKey,
            child: Column(
              children: [

                Container(
                  padding: EdgeInsets.only(left: 8, right: 8, top: 18, bottom: 8),
                  decoration: BoxDecoration(
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
                        controller: _Fname,
                        focusNode: _focusNodes[0],
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppTheme.red
                        ),
                        //  obscureText: !_passwordVisible,
                        decoration: InputDecoration(
                            label: Text("First Name"),
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 10.sp,
                                color: Colors.grey
                            ),
                            hintText:"Nayon",
                            prefixIcon: Icon(
                              Icons.person_outline,
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
                            return "Name must not be empty";
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.only(left: 8, right: 8, top: 18, bottom: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: _focusNodes[5].hasFocus ? Colors.grey.shade200 : Colors.transparent,
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
                        controller: _Lname,
                        focusNode: _focusNodes[5],
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppTheme.red
                        ),
                        //  obscureText: !_passwordVisible,
                        decoration: InputDecoration(
                            label: Text("Last Name"),
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 10.sp,
                                color: Colors.grey
                            ),
                            hintText:"Talukder",
                            prefixIcon: Icon(
                              Icons.person_outline,
                              color: _focusNodes[5].hasFocus ? AppTheme.red : Colors.grey,
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
                            return "Last Name must not be empty";
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.only(left: 8, right: 8, top: 18, bottom: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: _focusNodes[1].hasFocus ? Colors.grey.shade200 : Colors.transparent,
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
                        controller: _number,
                        focusNode: _focusNodes[1],
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppTheme.red
                        ),
                        //  obscureText: !_passwordVisible,
                        decoration: InputDecoration(
                            label: Text("Phone"),
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 10.sp,
                                color: Colors.grey
                            ),
                            hintText:"+8801** **** ***",
                            prefixIcon: Icon(
                              Icons.phone_android,
                              color: _focusNodes[1].hasFocus ? AppTheme.red : Colors.grey,
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

                SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.only(left: 8, right: 8, top: 18, bottom: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: _focusNodes[2].hasFocus ? Colors.grey.shade200 : Colors.transparent,
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
                        controller: _pass,
                        focusNode: _focusNodes[2],
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppTheme.red
                        ),
                        //  obscureText: !_passwordVisible,
                        decoration: InputDecoration(
                          label: const Text("PASSWORD"),
                          labelStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 10.sp,
                              color: Colors.grey
                          ),
                          hintText: "******",
                          prefixIcon: Icon(
                            Icons.lock_outline,
                            color: _focusNodes[2].hasFocus ? AppTheme.red : Colors.grey,
                          ),
                          prefixIconColor: AppTheme.red,
                          contentPadding: EdgeInsets.only(left: 20, right: 20),
                          border: OutlineInputBorder(borderSide: BorderSide.none),
                          hintStyle: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w200
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                                _passwordVisible ?  Icons.visibility_outlined : Icons.visibility_off_outlined,
                                color: Colors.grey
                            ), onPressed: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                          ),
                        ),
                        validator: (value){
                          if(value!.isEmpty ){
                            return "Password must not be empty";
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.only(left: 8, right: 8, top: 18, bottom: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: _focusNodes[3].hasFocus ? Colors.grey.shade200 : Colors.transparent,
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
                        focusNode: _focusNodes[3],
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppTheme.red
                        ),
                        //  obscureText: !_passwordVisible,
                        decoration: InputDecoration(
                          label: const Text("CONFIRM PASSWORD"),
                          labelStyle: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 10.sp,
                              color: Colors.grey
                          ),
                          hintText: "******",
                          prefixIcon: Icon(
                            Icons.lock_outline,
                            color: _focusNodes[3].hasFocus ? AppTheme.red : Colors.grey,
                          ),
                          prefixIconColor: AppTheme.red,
                          contentPadding: EdgeInsets.only(left: 20, right: 20),
                          border: OutlineInputBorder(borderSide: BorderSide.none),
                          hintStyle: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w200
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                                _passwordVisible ?  Icons.visibility_outlined : Icons.visibility_off_outlined,
                                color: Colors.grey
                            ), onPressed: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                          ),
                        ),
                        validator: (value){
                          if(value!.isEmpty ){
                            return "Confirm Password must not be empty";
                          }else if(_pass.text != value ){
                            return "Password not match";
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.only(left: 8, right: 8, top: 18, bottom: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: _focusNodes[4].hasFocus ? Colors.grey.shade200 : Colors.transparent,
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
                        focusNode: _focusNodes[4],
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppTheme.red
                        ),
                        //  obscureText: !_passwordVisible,
                        decoration: InputDecoration(
                            label: Row(
                              children: [
                                Text("Refer Code"),
                                Text("(Optional)",style: TextStyle(color: AppTheme.red),),
                              ],
                            ),
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 10.sp,
                                color: Colors.grey
                            ),
                            hintText:"1234",
                            prefixIcon: Icon(
                              Icons.code_rounded,
                              color: _focusNodes[4].hasFocus ? AppTheme.red : Colors.grey,
                            ),
                            prefixIconColor: AppTheme.red,
                            contentPadding: EdgeInsets.only(left: 20, right: 20),
                            border: OutlineInputBorder(borderSide: BorderSide.none),
                            hintStyle: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w200
                            )
                        ),

                      ),
                    ],
                  ),
                ),

                SizedBox(height: 30,),
                InkWell(
                  onTap: (){
                    if(_signupKey.currentState!.validate()){
                      authController.signUp(_Fname.text, _Lname.text, widget.email, _number.text, _pass.text);
                    }
                  },
                  child: Container(
                    width: size.width,
                    margin: EdgeInsets.only(left: 40, right: 40),
                    padding: EdgeInsets.only(left: 30, right: 30, top: 15, bottom: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: AppTheme.red,
                    ),
                    child: authController.isSignUp.value ?Container(
                        height:20,
                        child: Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: AppTheme.white,
                          ),
                        )
                    ): Text(
                      "Create Account",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: AppTheme.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp
                      ),
                    ),
                  ),
                ),


                SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: ()=>Get.to(Login(), transition: Transition.rightToLeft,),
                      child: const Text(
                          "Already have an account? ", style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w100,
                          fontFamily: "ThemeFont"
                      )
                      ),
                    ),
                    TextButton(
                      onPressed: (){
                        Get.to(Login());
                      },
                      child: Text('Login', style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          fontFamily: "ThemeFont",
                          color: AppTheme.red
                      )),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),),
      ),

    );
  }


}
