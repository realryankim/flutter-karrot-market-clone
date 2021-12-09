import 'package:flutter/material.dart';

class MyKarrotDivider extends StatelessWidget {
  const MyKarrotDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 10,
      color: Colors.grey[200],
    );
  }
}
