import 'package:carrot_market_clone/controller/app_controller.dart';
import 'package:carrot_market_clone/widgets/my_karrot/my_karrot_list_view.dart';
import 'package:carrot_market_clone/widgets/my_karrot/user_items.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class MyKarrot extends StatelessWidget {
  const MyKarrot({Key? key}) : super(key: key);

  Widget _profile() {
    return Container(
      padding: EdgeInsets.all(15.0),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // 프로필 사진
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      // 프로필 수정 페이지로 이동
                    },
                    child: Container(
                      width: 75,
                      height: 75,
                      child: Stack(
                        children: [
                          Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(40.0),
                              child: Container(
                                width: 55,
                                height: 55,
                                child: Image.asset(
                                  'assets/images/user.png',
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 40,
                            left: 43,
                            child: Container(
                              padding: EdgeInsets.all(3.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                border: Border.all(color: Color(0xFFE0E0E0)),
                              ),
                              child: Icon(
                                Icons.camera_alt,
                                size: 15.0,
                                color: Colors.grey[500],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10.0),
                  // User 이름, 주소
                  GestureDetector(
                    onTap: () {
                      // 프로필로 이동
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ryan',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                        Text(
                          '서초구 서초1동',
                          style: TextStyle(
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              // > 아이콘
              GestureDetector(
                onTap: () {
                  // 프로필로 이동
                },
                child: Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 15.0,
                ),
              ),
            ],
          ),
          SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              UserItem(
                imageUrl: 'assets/images/note.svg',
                text: '판매내역',
                onTap: () {},
              ),
              UserItem(
                imageUrl: 'assets/images/shopping-bag.svg',
                text: '구매내역',
                onTap: () {},
              ),
              UserItem(
                imageUrl: 'assets/images/heart.svg',
                text: '관심목록',
                onTap: () {
                  Get.toNamed('/interesting_product');
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: GestureDetector(
          onTap: () {},
          child: Row(
            children: [
              Text(
                '나의 당근',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        elevation: 1.0,
        actions: [
          IconButton(
            onPressed: () {
              // 로그 아웃
              FirebaseAuth.instance.signOut();
              AppController.to.currentIndex.value = 0;
              Get.offAllNamed('/');
            },
            icon: Icon(
              Icons.logout,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _profile(),
            SizedBox(height: 10.0),
            MyKarrotListView(),
          ],
        ),
      ),
    );
  }
}
