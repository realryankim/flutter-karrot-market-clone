import 'package:carrot_market_clone/widgets/auth/auth_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Auth extends StatelessWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: Get.back,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.black,
          ),
        ),
        title: Text(
          '로그인',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          Get.focusScope!.unfocus();
        },
        child: AuthForm(),
      ),
    );
  }
}
