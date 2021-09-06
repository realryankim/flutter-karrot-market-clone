import 'package:carrot_market_clone/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: () {
            print('다른 지역');
          },
          child: PopupMenuButton<String>(
            offset: Offset(0, 35),
            shape: ShapeBorder.lerp(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular((10.0))),
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular((10.0))),
                1),
            onSelected: (String where) {
              controller.changeLocation(where);
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(value: 'ara', child: Text('아라동')),
                PopupMenuItem(value: 'ora', child: Text('오라동')),
                PopupMenuItem(
                    value: 'setting_neighborhood', child: Text('내 동네 설정하기')),
              ];
            },
            child: Obx(
              () => Row(
                children: [
                  Text(controller.locationTypeToString[
                      controller.currentLocation!.value]!),
                  Icon(Icons.keyboard_arrow_down_rounded),
                ],
              ),
            ),
          ),
        ),
        elevation: 1.0,
        actions: [
          IconButton(
            onPressed: () {
              print('상품 검색');
            },
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              print('카테고리');
            },
            icon: Icon(Icons.tune),
          ),
          IconButton(
            onPressed: () {
              print('알림');
            },
            icon: SvgPicture.asset(
              'assets/svg/bell.svg',
              width: 22,
            ),
          ),
        ],
      ),
      body: Container(),
    );
  }
}
