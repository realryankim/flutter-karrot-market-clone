import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

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
      bottomNavigationBar: Container(),
    );
  }
}
