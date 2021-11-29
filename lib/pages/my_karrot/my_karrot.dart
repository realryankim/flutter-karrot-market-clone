import 'package:carrot_market_clone/controller/app_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyKarrot extends StatelessWidget {
  const MyKarrot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Center(
        child: Text('나의 당근 페이지'),
      ),
    );
  }
}
