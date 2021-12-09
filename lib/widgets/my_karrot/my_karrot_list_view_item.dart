import 'package:flutter/material.dart';

class MyKarrotListViewItem extends StatelessWidget {
  MyKarrotListViewItem({
    Key? key,
    required this.iconName,
    required this.optionName,
    required this.onTap,
  }) : super(key: key);

  final IconData iconName;
  final String optionName;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(15.0),
        child: Row(
          children: [
            Icon(
              iconName,
            ),
            SizedBox(width: 15),
            Text(
              optionName,
            ),
          ],
        ),
      ),
    );
  }
}
