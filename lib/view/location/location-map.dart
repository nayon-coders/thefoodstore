import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocode/geocode.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location_geocoder/location_geocoder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:the_food_store/app_confige.dart';
import 'package:the_food_store/app_theme.dart';
import 'package:the_food_store/view/home-screen.dart';
import 'package:the_food_store/view/login.dart';

class LocationMap extends StatefulWidget {
  const LocationMap({Key? key}) : super(key: key);

  @override
  State<LocationMap> createState() => _LocationMapState();
}

class _LocationMapState extends State<LocationMap> {
  Completer<GoogleMapController> _controller = Completer();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentLocation();
  }
  var lat, long, address;
  bool isMapLoaded = false;




  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  getCurrentLocation()async{
    Future<Position> data = _determinePosition();
    SharedPreferences _prfs = await SharedPreferences.getInstance();
    data.then((value) => setState(() async{
      print("value $value");
      setState((){

        lat = value.latitude;
        long = value.longitude;
        getAddress(lat, long);
        addMarker();
        isMapLoaded = true;
      });
      // Passed the coordinates of latitude and longitude
      // Passed the coordinates of latitude and longitude

      _prfs.setDouble("lat", value.latitude);
      _prfs.setDouble("long", value.longitude);
      _prfs.setString("address", address);
      print("lat long $long");



    }));
  }

//For convert lat long to address
  getAddress(lat, long) async {

    List<Placemark> placemarks = await placemarkFromCoordinates(lat, long);
    setState((){
      address = "${placemarks[0].name}, ${placemarks[2].name}, ${placemarks[3].name}, ${placemarks[3].name},  ${placemarks[0].locality}, ${placemarks[0].country},";
    });
    print("address $address");
  }



  //marker
  List<Marker> _markers = [];
  addMarker(){
    _markers.add(
        Marker(
            markerId: MarkerId('SomeId'),
            position: LatLng(lat, long),
            infoWindow: InfoWindow(
              title: "Current Location"
            )
        )
    );
  }


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppTheme.yellow,
        body: isMapLoaded ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           
            Expanded(
                child: Stack(
                  children: [

                    Container(
                      height: size.height,
                      // padding: EdgeInsets.only(top: 30, bottom: 20, ),
                      decoration: BoxDecoration(
                          //color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                      child:  GoogleMap(
                        mapType: MapType.normal,
                        initialCameraPosition: CameraPosition(
                          target: LatLng(lat, long),
                          zoom: 16.4746,
                        ),
                        markers: Set<Marker>.of(_markers),
                        onMapCreated: (GoogleMapController controller) {
                          _controller.complete(controller);
                        },
                      ),
                      ),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        padding: EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 30),
                        width: size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                        child: Column(
                          children: [
                            ListTile(
                              leading: Icon(Icons.location_on_outlined, color: Colors.black54, size: 26.sp,),
                              title: Text("Current Location" , style: TextStyle(fontWeight: FontWeight.bold),),
                              subtitle: Text("$address"),
                            ),
                            SizedBox(height: 20,),

                            InkWell(
                              onTap: ()=>Get.to(Login(), transition: Transition.rightToLeft, duration: Duration(milliseconds: 200)),
                              child: Container(
                                width: size.width,
                                margin: EdgeInsets.only(left: 40, right: 40),
                                padding: EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: AppTheme.red,
                                ),
                                child: Text(
                                  "Confirm Location",
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

                    Positioned(
                      right: 20,
                      top: 10,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)
                        ),
                        child: TextButton(
                          onPressed: ()=>isLogin(),
                          child: Text("Skip",style: TextStyle(color: AppTheme.red),),
                        ),
                      ),
                    ),
                  ],
                ),

            )

          ],
        ):Center(child: CircularProgressIndicator(color: AppTheme.white,),),

      ),
    );
  }

  isLogin() async{
    SharedPreferences _prfs = await SharedPreferences.getInstance();
    if(_prfs.getString("isLogin") == "1"){
      Get.to(Home(), transition: Transition.rightToLeft);
    }else{
      Get.to(Login(), transition: Transition.rightToLeft);
    }
  }
}
