import 'package:carrot_market_clone/utils/colors.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  PrimaryButton({
    Key? key,
    required this.onTap,
    required this.text,
  }) : super(key: key);

  final Function() onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return ElevatedButton(
      onPressed: onTap,
      child: Text(text),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(width - 25, 45),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        // TODO: AuthController를 만들어서, TextFormField의 email, 비밀번호가 입력이 되었을 때, 색깔 변화
        primary: text.length > 0 ? ColorsKM.primary : Colors.grey,
        onPrimary: Colors.white,
        alignment: Alignment.center,
      ),
    );
  }
}
