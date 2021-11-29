import 'package:carrot_market_clone/pages/app.dart';
import 'package:carrot_market_clone/pages/start/splash.dart';
import 'package:carrot_market_clone/pages/start/start.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
          return App();
        }
        return Start();
      },
    );
  }
}
