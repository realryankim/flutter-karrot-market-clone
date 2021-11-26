import 'package:carrot_market_clone/app.dart';
import 'package:carrot_market_clone/binding/init_binding.dart';
import 'package:carrot_market_clone/pages/auth/auth.dart';
import 'package:carrot_market_clone/pages/interesting_product.dart';
import 'package:carrot_market_clone/pages/start/start.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
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
      initialRoute: '/',
      getPages: [
        // GetPage(name: '/', page: () => Splash()),
        GetPage(name: '/', page: () => Start()),
        GetPage(name: '/auth', page: () => Auth()),
      ],
    );
  }
}
