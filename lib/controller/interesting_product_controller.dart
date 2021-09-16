import 'package:carrot_market_clone/repository/contents_repository.dart';
import 'package:get/get.dart';

// working on
class InterestingProductController extends GetxController {
  static InterestingProductController get to => Get.find();

  late ContentsRepository contentsRepository;

  bool isMyFavoriteProduct = false;

  @override
  void onInit() {
    super.onInit();
  }

  Future<List<dynamic>?> loadInterestingProducts() async {
    return await contentsRepository.loadFavoriteProducts();
  }

  void changeInterestingProduct(bool currentFavoriteStatus) {
    isMyFavoriteProduct = !currentFavoriteStatus;
  }
}
