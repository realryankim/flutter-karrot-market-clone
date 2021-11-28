import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: CircularProgressIndicator while loading
    // TODO: 로그인 안됐을 시, start로
    // TODO: 로그인 했었을 시, home으로
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Image.asset(
            'assets/images/logo.png',
            width: 90,
            height: 90,
          ),
        ),
      ),
    );
  }
}
