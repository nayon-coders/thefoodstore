import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';

import '../app_theme.dart';

class ChangeProfile extends StatefulWidget {
  const ChangeProfile({Key? key}) : super(key: key);

  @override
  State<ChangeProfile> createState() => _ChangeProfileState();
}

class _ChangeProfileState extends State<ChangeProfile> {
  List<FocusNode> _focusNodes = [
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
  ];
  late bool _passwordVisible;

  final _name = TextEditingController();
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
      backgroundColor: Colors.grey.shade200,
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
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Change Profile",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 30.sp,
                  ),
                ),
                SizedBox(height: 20,),
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset("assets/images/logo.png", height: 150, width: 150,),
                ),
                InkWell(
                  child: TextButton(
                    onPressed: (){},
                    child: Text("Upload Profile"),
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
                        focusNode: _focusNodes[0],
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppTheme.red
                        ),
                        //  obscureText: !_passwordVisible,
                        decoration: InputDecoration(
                            label: Text("Full Name"),
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 10.sp,
                                color: Colors.grey
                            ),
                            hintText:"Nayon Talukder",
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
                        focusNode: _focusNodes[1],
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
                            hintText:"johon@gmail.com",
                            prefixIcon: Icon(
                              Icons.email_outlined,
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
                        focusNode: _focusNodes[5],
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppTheme.red
                        ),
                        //  obscureText: !_passwordVisible,
                        decoration: InputDecoration(
                            label: Text("Mobile Number"),
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 10.sp,
                                color: Colors.grey
                            ),
                            hintText:"+88018 **** ****",
                            prefixIcon: Icon(
                              Icons.phone_android,
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
                            return "Mobile Number must not be empty";
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
                          }else if(double.parse(value) > 5){
                            return "Password must be 6 or more than 6 characters.";
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20,),


                SizedBox(height: 30,),
                InkWell(
                  onTap: ()=>Get.back(),
                  child: Container(
                    width: size.width,
                    margin: EdgeInsets.only(left: 40, right: 40),
                    padding: EdgeInsets.only(left: 30, right: 30, top: 15, bottom: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: AppTheme.red,
                    ),
                    child: Text(
                      "Change Profile",
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
      ),
    );
  }
}
