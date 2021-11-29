import 'package:carrot_market_clone/utils/colors.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  PrimaryButton({
    Key? key,
    required this.onTap,
    required this.buttonText,
  }) : super(key: key);

  final Function() onTap;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return ElevatedButton(
      onPressed: onTap,
      child: Text(buttonText),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(width - 25, 45),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        primary: ColorsKM.primary,
        onPrimary: Colors.white,
        alignment: Alignment.center,
      ),
    );
  }
}
