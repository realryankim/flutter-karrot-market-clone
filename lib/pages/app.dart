import 'package:carrot_market_clone/controller/app_controller.dart';
import 'package:carrot_market_clone/pages/chats/chats.dart';
import 'package:carrot_market_clone/pages/home/home.dart';
import 'package:carrot_market_clone/pages/nearby/nearby.dart';
import 'package:carrot_market_clone/pages/my_local/my_local.dart';
import 'package:carrot_market_clone/pages/my_karrot/my_karrot.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class App extends GetView<AppController> {
  const App({Key? key}) : super(key: key);

  Widget _bodyWidget() {
    switch (RouteName.values[controller.currentIndex.value]) {
      case RouteName.HOME:
        return Home();
        break;
      case RouteName.MYLOCAL:
        return MyLocal();
        break;
      case RouteName.NEARBY:
        return Nearby();
        break;
      case RouteName.CHATS:
        return Chats();
        break;
      case RouteName.MYKARROT:
        return MyKarrot();
        break;
    }
    return Container();
  }

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
      body: Obx(
        () {
          return _bodyWidget();
        },
      ),
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
