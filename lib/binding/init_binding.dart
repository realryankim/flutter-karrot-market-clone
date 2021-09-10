import 'package:carrot_market_clone/controller/app_controller.dart';
import 'package:carrot_market_clone/controller/product_detail_controller.dart';
import 'package:get/get.dart';

class InitBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AppController());
  }
}
