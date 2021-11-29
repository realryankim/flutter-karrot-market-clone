import 'package:get/get.dart';

enum RouteName {
  HOME,
  MYLOCAL,
  NEARBY,
  CHATS,
  MYKARROT,
}

class AppController extends GetxService {
  static AppController get to => Get.find();

  late RxInt currentIndex = 0.obs;

  void changePageIndex(int index) {
    currentIndex(index);
  }
}
