import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:the_food_store/app_theme.dart';
import 'package:the_food_store/controller/auth_controller.dart';
import 'package:the_food_store/view/home-screen.dart';
import 'package:the_food_store/view/sign-up.dart';
import 'package:the_food_store/view/signup_email.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final AuthController authController = Get.put(AuthController());

  final _loginFromKey = GlobalKey<FormState>();
  List<FocusNode> _focusNodes = [
    FocusNode(),
    FocusNode(),
  ];
  final email = TextEditingController();
  final pass = TextEditingController();
  late bool _passwordVisible;

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50,),
              Center(
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset("assets/images/logo.png", height: 100, width: 100, fit: BoxFit.cover,)),
              ),
              const SizedBox(height: 10,),
              Text("THE FOOD STORE",
                style: TextStyle(
                    color: AppTheme.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp
                ),
              ),

              SizedBox(height: 50,),

              Form(
                  key: _loginFromKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment:CrossAxisAlignment.start,
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
                                  hintText:"johon@gmail.com",
                                  prefixIcon: Icon(
                                     Icons.email_outlined,
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
                              controller: pass,
                              focusNode: _focusNodes[1],
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
                                  color: _focusNodes[1].hasFocus ? AppTheme.red : Colors.grey,
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
                      SizedBox(height: 10,),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: TextButton(
                          onPressed: (){
                           // Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgetPassword()));
                          },
                          child: Text(
                              "Forget Paassword?", style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w800,
                              fontFamily: "ThemeFont",
                              color: AppTheme.red,
                          )
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),

                      InkWell(
                        onTap: (){
                              if(_loginFromKey.currentState!.validate()){
                                authController.login(email.text, pass.text);
                              }
                              Get.to(Login(), transition: Transition.rightToLeft, duration: Duration(milliseconds: 200));
                          },
                          child: Obx(()=>
                             Container(
                            width: size.width,
                            margin: EdgeInsets.only(left: 40, right: 40),
                            padding: EdgeInsets.only(left: 30, right: 30, top: 15, bottom: 15),
                            decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: AppTheme.red,
                            ),
                            child: authController.isLoading.value == true? Center(child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2,),) : Text(
                            "Login",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: AppTheme.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.sp
                              ),
                            ),
                        ),
                          ),
                      ),


                      SizedBox(height: 30,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: ()=>Get.to(SignUpEmail(), transition: Transition.rightToLeft,),
                            child: const Text(
                                "Don't have an account?", style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w100,
                                fontFamily: "ThemeFont"
                            )
                            ),
                          ),
                          SizedBox(width: 5,),
                          TextButton(
                            onPressed: ()=>Get.to(SignUpEmail(), transition: Transition.rightToLeft,),
                            child: Text('Sign up', style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                fontFamily: "ThemeFont",
                                color: AppTheme.red
                            )),
                          )
                        ],
                      ),
                      SizedBox(height: 10,),
                      Center(
                        child: InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (contex)=>Home()));
                            //Get.to(Home(), transition: Transition.rightToLeft,);
                            print("home page");
                          },
                          child: Text('Go as a Gust',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              fontFamily: "ThemeFont",
                              color: AppTheme.red
                          )
                          ),
                        ),
                      ),





                    ],
                  ))

            ],
          ),
        ),
      )

    );
  }
}
