import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:the_food_store/app_theme.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'package:the_food_store/view/location/get-start-location.dart';
class ReadyScreen extends StatefulWidget {
  const ReadyScreen({Key? key}) : super(key: key);

  @override
  State<ReadyScreen> createState() => _ReadyScreenState();
}

class _ReadyScreenState extends State<ReadyScreen> {
 List readyScreen = [
   {
     "title" : "Save Food with our new Feature!",
     "image" : "assets/images/sp1.png",
   },
   {
     "title" : "Save Food with our new Feature!",
     "image" : "assets/images/sp2.png",
   },
   {
     "title" : "Fast, rescued food at your service.",
     "image" : "assets/images/sp3.png",
   },
 ];
 int _current = 0;
 final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        padding: EdgeInsets.only(top: 30, ),
        decoration: BoxDecoration(
          color: AppTheme.yellow,
          gradient: LinearGradient(
            colors: [
              AppTheme.yellow,
              AppTheme.red,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp,
          ),
        ),
        child: Stack(
          children: [
            CarouselSlider.builder(
              itemCount: readyScreen.length,
              itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) => Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset("assets/images/logo.png", height: 100, width: 100, fit: BoxFit.cover,)),
                Padding(
                  padding: EdgeInsets.only(left: 30, right: 30),
                  child: Text("${readyScreen[itemIndex]['title']}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 40.sp,
                        fontWeight: FontWeight.w100,
                        color: Color(0xFFF1F1F1)
                    ),
                  ),
                ),

                Image.asset("${readyScreen[itemIndex]['image']}", height: 200,  width: size.width,),

                itemIndex == 2 ? InkWell(
                  onTap: ()=>Get.to(GetStartLocation(), transition: Transition.rightToLeft),
                  child: Container(
                    width: size.width,
                    margin: EdgeInsets.only(left: 40, right: 40),
                    padding: EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.white,
                    ),
                    child: Text(
                      "Get Start",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppTheme.red,
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp
                      ),
                    ),
                  ),
                ):Center(),

              ],
            ),
                options: CarouselOptions(
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  },
                  height: size.height,
                  aspectRatio: 16/9,
                  viewportFraction: 1,
                  initialPage: 0,
                  enableInfiniteScroll: false,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 7),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                )
            ),
            Positioned(
              bottom: 10,
              left: size.width/2.5,
              right: size.width/2.5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: readyScreen.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => _controller.animateToPage(entry.key),
                    child: Container(
                      width: 12.0,
                      height: 12.0,
                      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: (Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.white)
                              .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),




      ),
    );
  }
}
