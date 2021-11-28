import 'package:carrot_market_clone/app.dart';
import 'package:carrot_market_clone/binding/init_binding.dart';
import 'package:carrot_market_clone/pages/interesting_product.dart';
import 'package:carrot_market_clone/pages/login/login.dart';
import 'package:carrot_market_clone/pages/sign_up/sign_up.dart';
import 'package:carrot_market_clone/pages/start/splash.dart';
import 'package:carrot_market_clone/pages/start/start.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Carrot Market Clone',
      theme: ThemeData(
        primaryColor: Colors.black,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: AppBarTheme(
          color: Colors.white,
        ),
      ),
      initialBinding: InitBinding(),
      initialRoute: '/start',
      getPages: [
        // GetPage(
        //   name: '/',
        //   page: () => Splash(),
        //   transition: Transition.fadeIn,
        // ),
        GetPage(
          name: '/start',
          page: () => Start(),
        ),
        GetPage(
          name: '/login',
          page: () => Login(),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: '/signup',
          page: () => SignUp(),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: '/app',
          page: () => App(),
          transition: Transition.rightToLeft,
        )
      ],
    );
  }
}
