import 'package:carrot_market_clone/controller/sign_up_controller.dart';
import 'package:carrot_market_clone/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpForm extends GetView<SignUpController> {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 10.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              text: "안녕하세요!",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.black,
              ),
              children: [
                TextSpan(text: "\n이메일을 입력해주세요."),
              ],
            ),
          ),
          SizedBox(height: 8),
          Text(
            "중고 거래부터 동네 정보까지, 이웃과 함께해요. \n가깝고 따뜻한 당신의 근처를 만들어요.",
            style: TextStyle(
              fontSize: 13,
            ),
          ),
          SizedBox(height: 25),
          // 회원가입 폼
          SingleChildScrollView(
            child: Form(
              child: Column(
                children: [
                  TextFormField(
                    autocorrect: false,
                    textCapitalization: TextCapitalization.none,
                    enableSuggestions: false,
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      controller.userEmail.value = value;
                    },
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 12),
                      fillColor: Color(0XFFF8F8F8),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      hintText: '이메일 주소',
                      hintStyle: const TextStyle(
                        color: Colors.grey,
                        fontFamily: 'NotoSans',
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    autocorrect: false,
                    textCapitalization: TextCapitalization.none,
                    enableSuggestions: false,
                    keyboardType: TextInputType.text,
                    onChanged: (value) {
                      controller.userName.value = value;
                    },
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 12),
                      fillColor: Color(0XFFF8F8F8),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      hintText: '사용자 이름',
                      hintStyle: const TextStyle(
                        color: Colors.grey,
                        fontFamily: 'NotoSans',
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    autocorrect: false,
                    textCapitalization: TextCapitalization.none,
                    enableSuggestions: false,
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    onChanged: (value) {
                      controller.userPassword.value = value;
                    },
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 12),
                      fillColor: Color(0XFFF8F8F8),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      hintText: '비밀번호',
                      hintStyle: const TextStyle(
                        color: Colors.grey,
                        fontFamily: 'NotoSans',
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  PrimaryButton(
                    onTap: () {
                      controller.trySubmit();
                    },
                    buttonText: '회원가입',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
