import 'package:intl/intl.dart';

class DataUtils {
// 가격의 숫자 변환
  static final oCcy = NumberFormat("#,###", "ko_KR");
  static String calcStringToWon(String priceString) {
    if (priceString == '무료나눔') return priceString;
    return "${oCcy.format(int.parse(priceString))}원";
  }
}
