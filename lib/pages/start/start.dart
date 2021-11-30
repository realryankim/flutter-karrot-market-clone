import 'package:carrot_market_clone/utils/colors.dart';
import 'package:carrot_market_clone/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Start extends StatelessWidget {
  const Start({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double width = size.width;
    final double height = size.height;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 190),
                  Image.asset(
                    'assets/images/logo.png',
                    width: 120,
                    height: 120,
                  ),
                  SizedBox(height: 15),
                  Text(
                    "당신 근처의 당근마켓",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "중고 거래부터 동네 정보까지,",
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  ),
                  Text(
                    "지금 내 동네를 선택하고 시작해보세요!",
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 25,
                child: Column(
                  children: [
                    PrimaryButton(
                      onTap: () {
                        Get.toNamed('/signup');
                      },
                      // text: '시작하기', // 기존
                      buttonText: '회원가입',
                    ),
                    SizedBox(height: 35),
                    Row(
                      children: [
                        Text(
                          "이미 계정이 있나요? ",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed('/login');
                          },
                          child: Text(
                            "로그인 ",
                            style: TextStyle(
                              color: ColorsKM.primary,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
