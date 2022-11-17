import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDB extends GetxController{
  var isLoading = false.obs;
  void loading(value){
    isLoading.value = value;
    update();
  }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getData();
  }

  //local data
  var token, lat, long, address;

  void getData()async{
    loading(true);
    SharedPreferences _prsf = await SharedPreferences.getInstance();
    address = _prsf.getString("address");
    token = _prsf.getString("token");
    lat = _prsf.getDouble("lat");
    long = _prsf.getDouble("lat");
    loading(false);
  }
}