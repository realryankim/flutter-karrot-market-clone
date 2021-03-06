import 'package:flutter/material.dart';

class AppBarIcon extends StatelessWidget {
  AppBarIcon({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  final IconData icon;
  final void Function() onPressed;

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
