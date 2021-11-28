import 'package:carrot_market_clone/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatelessWidget {
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
          // 로그인 폼
          SingleChildScrollView(
            child: Form(
              child: Column(
                children: [
                  TextFormField(
                    autocorrect: false,
                    textCapitalization: TextCapitalization.none,
                    enableSuggestions: false,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {},
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
                        borderSide:
                            // text.length > 0 || text.isNotEmpty ?
                            BorderSide(
                          color: Colors.grey,
                        ),
                        // : BorderSide.none
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
                    validator: (value) {},
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
                        borderSide:
                            // text.length > 0 || text.isNotEmpty ?
                            BorderSide(
                          color: Colors.grey,
                        ),
                        // : BorderSide.none
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
                    validator: (value) {},
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
                        borderSide:
                            // text.length > 0 || text.isNotEmpty ?
                            BorderSide(
                          color: Colors.grey,
                        ),
                        // : BorderSide.none
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
                  // TODO: 이메일, 비밀번호 잘못 입력 시, 스낵바(BG: black, TEXT: white)
                  // "이메일이 잘못되었어요. 다시 한번 확인해주세요."
                  PrimaryButton(
                    onTap: () {
                      // TODO: validation
                      // TODO: 회원 가입 완료 모달 및 로그인 페이지로 이동
                    },
                    text: '회원가입',
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
