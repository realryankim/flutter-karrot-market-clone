import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailScrollController extends GetxController
    with SingleGetTickerProviderMixin {
  static ProductDetailScrollController get to => Get.find();

  ScrollController scrollController = ScrollController();
  RxDouble scrollPositionToAlpha = 0.0.obs;
  late AnimationController _animationController;
  late Animation colorTween;

  @override
  void onInit() {
    _animationController = AnimationController(vsync: this);
    colorTween = ColorTween(begin: Colors.white, end: Colors.black)
        .animate(_animationController);
    scrollController.addListener(() {
      if (scrollPositionToAlpha > 255) {
        scrollPositionToAlpha(255);
      } else {
        scrollPositionToAlpha(scrollController.offset);
      }
      // _animationController.value는 0~1 사이의 값을 갖는다.
      _animationController.value = scrollPositionToAlpha / 255;
    });

    super.onInit();
  }
}
