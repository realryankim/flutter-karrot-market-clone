import 'package:carrot_market_clone/pages/app.dart';
import 'package:carrot_market_clone/pages/bridge_page.dart';
import 'package:carrot_market_clone/utils/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class BridgeFirebase extends StatelessWidget {
  const BridgeFirebase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('Firebase load fail'));
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return BridgePage();
        }
        return Center(
          child: CircularProgressIndicator(
            color: ColorsKM.primary,
          ),
        );
      },
    );
  }
}
