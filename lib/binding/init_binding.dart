import 'package:carrot_market_clone/controller/app_controller.dart';
import 'package:carrot_market_clone/controller/home_controller.dart';
import 'package:carrot_market_clone/controller/login_controller.dart';
import 'package:carrot_market_clone/controller/product_detail_controller.dart';
import 'package:carrot_market_clone/controller/sign_up_controller.dart';
import 'package:get/get.dart';

class InitBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AppController());
    Get.put(SignUpController());
    Get.put(LoginController());
    //
    Get.put(HomeController());
  }
}

/*
Think: 로그아웃을 할 때, "HomeController" onDelete()가 불려져서,
다시 로그인을 했을 때, HomeController가 메모리에 올라가있지 않아서,
HomeController를 찾을 수 없다는 에러가 발생한다.
Get.put을 써도 메모리에 큰 영향을 주지는 않겠지만,
Get.lazyPut을 활용할 수는 없을까?
*/