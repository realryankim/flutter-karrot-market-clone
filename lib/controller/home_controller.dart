import 'package:carrot_market_clone/repository/contents_repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  RxString? currentLocation = "".obs;
  final Map<String, String> locationTypeToString = {
    'ara': '아라동',
    'ora': '오라동',
    'setting_neighborhood': '내 동네 설정하기',
  };
  late ContentsRepository contentsRepository;
  bool openOtherLocal = false;

  @override
  void onInit() {
    changeLocation('ara');
    contentsRepository = ContentsRepository();
    openOtherLocal = false;
    super.onInit();
  }

  void changeLocation(String location) {
    currentLocation!(location);
  }

  void changeArrow() {
    openOtherLocal = !openOtherLocal;
  }

  Future<List<dynamic>> loadContents() {
    return contentsRepository.loadContentsFromLocation(currentLocation!.value);
  }
}
