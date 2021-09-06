import 'package:carrot_market_clone/controller/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class App extends GetView<AppController> {
  const App({Key? key}) : super(key: key);

  BottomNavigationBarItem _bottomNavigationBarItem(
      String iconName, String label) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: EdgeInsets.only(bottom: 5.0),
        child: SvgPicture.asset('assets/svg/${iconName}_off.svg', width: 22),
      ),
      activeIcon: Padding(
        padding: EdgeInsets.only(bottom: 5.0),
        child: SvgPicture.asset('assets/svg/${iconName}_on.svg', width: 22),
      ),
      label: label,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: () {
            print('다른 지역');
          },
          child: Row(
            children: [
              Text('아라동'),
              Icon(Icons.keyboard_arrow_down_rounded),
            ],
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
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: controller.currentIndex.value,
          selectedFontSize: 12.0,
          showSelectedLabels: true,
          selectedItemColor: Colors.black,
          selectedLabelStyle: TextStyle(color: Colors.black),
          onTap: controller.changePageIndex,
          items: [
            _bottomNavigationBarItem('home', '홈'),
            _bottomNavigationBarItem('notes', '동네생활'),
            _bottomNavigationBarItem('location', '내 근처'),
            _bottomNavigationBarItem('chat', '채팅'),
            _bottomNavigationBarItem('user', '나의 당근'),
          ],
        ),
      ),
    );
  }
}
