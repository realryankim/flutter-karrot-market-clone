import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  RxString? currentLocation = "".obs;

  final Map<String, String> locationTypeToString = {
    'ara': '아라동',
    'ora': '오라동',
    'setting_neighborhood': '내 동네 설정하기',
  };

  void changeLocation(String location) {
    currentLocation!(location);
  }

  @override
  void onInit() {
    changeLocation('ara');
    super.onInit();
  }
}
