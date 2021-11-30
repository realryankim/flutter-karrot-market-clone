import 'package:carrot_market_clone/pages/app.dart';
import 'package:carrot_market_clone/pages/start/splash.dart';
import 'package:carrot_market_clone/pages/start/start.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BridgePage extends StatelessWidget {
  const BridgePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Splash();
        }
        if (snapshot.hasData) {
          // TODO: StreamBuilder 내에서 Get.off('/app'); 를 활용할 수 있는 방법
          // Why?: 로그인이 되면 signout을 하기 전까지는, 뒤로 가면 안되는데,
          // 현재는 뒤로 가는 것이 가능한 문제가 있음.
          return App();
        } else {
          return Start();
        }
      },
    );
  }
}
