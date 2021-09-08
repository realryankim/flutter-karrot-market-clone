import 'package:flutter/material.dart';

class MannerTemperature extends StatelessWidget {
  double mannerTemp;
  late int level;
  final List<Color> tempColors = [
    Color(0xff072038),
    Color(0xff0d3a65),
    Color(0xff186ec0),
    Color(0xff37b24d),
    Color(0xffffad13),
    Color(0xfff76707),
  ];

  MannerTemperature({Key? key, required this.mannerTemp}) {
    _calcTempLevel();
  }

  void _calcTempLevel() {
    if (mannerTemp <= 20) {
      level = 0;
    } else if (mannerTemp > 20 && mannerTemp <= 32) {
      level = 1;
    } else if (mannerTemp > 20 && mannerTemp <= 32) {
      level = 2;
    } else if (mannerTemp > 32 && mannerTemp <= 40) {
      level = 3;
    } else if (mannerTemp > 40 && mannerTemp <= 50) {
      level = 4;
    } else if (mannerTemp > 50) {
      level = 5;
    }
  }

  Widget _makeTempLabelAndBar() {
    return Container(
      width: 60,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$mannerTemp°C',
            style: TextStyle(
              color: tempColors[level],
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),
          Padding(
            padding: EdgeInsets.only(left: 7.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Container(
                width: 50,
                height: 4.0,
                color: Colors.black.withOpacity(0.15),
                child: Row(
                  children: [
                    Container(
                      height: 4.0,
                      // 온도 값은 0~99까지
                      width: 50 / 99 * mannerTemp,
                      color: tempColors[level],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _makeTempLabelAndBar(),
            Container(
              margin: EdgeInsets.only(left: 7.0),
              width: 30.0,
              height: 30.0,
              child: Image.asset('assets/images/level-$level.jpg'),
            ),
          ],
        ),
        SizedBox(height: 3.0),
        Text(
          '매너 온도',
          style: TextStyle(
            decoration: TextDecoration.underline,
            fontSize: 11.0,
            color: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }
}
