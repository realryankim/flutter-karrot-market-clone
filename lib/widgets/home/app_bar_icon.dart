import 'package:flutter/material.dart';

class AppBarIcon extends StatelessWidget {
  AppBarIcon({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  IconData icon;
  void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        icon,
        color: Colors.black,
      ),
    );
  }
}
