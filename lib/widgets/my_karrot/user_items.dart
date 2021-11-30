import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UserItem extends StatelessWidget {
  UserItem({
    Key? key,
    required this.text,
    required this.imageUrl,
    required this.onTap,
  }) : super(key: key);

  String text;
  String imageUrl;
  void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(40.0),
            child: Container(
              width: 55,
              height: 55,
              color: Color(0xFFFFE98F),
              child: Center(
                child: Container(
                  width: 20,
                  height: 20,
                  child: SvgPicture.asset(imageUrl),
                ),
              ),
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            text,
            style: TextStyle(
              fontSize: 13.0,
            ),
          ),
        ],
      ),
    );
  }
}
