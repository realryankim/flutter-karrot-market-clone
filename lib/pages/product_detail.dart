import 'package:carousel_slider/carousel_slider.dart';
import 'package:carrot_market_clone/components/manner_temperature.dart';
import 'package:carrot_market_clone/components/other_selling_content_list.dart';
import 'package:carrot_market_clone/controller/interesting_product_controller.dart';
import 'package:carrot_market_clone/controller/product_detail_controller.dart';
import 'package:carrot_market_clone/pages/interesting_product.dart';
import 'package:carrot_market_clone/repository/contents_repository.dart';
import 'package:carrot_market_clone/utils/data_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ProductDetail extends StatefulWidget {
  ProductDetail({Key? key, this.data}) : super(key: key);

  Map<String, dynamic>? data;

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  late double width;
  late double height;
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();
  late List<String> imgList;
  late int _current;
  late ProductDetailController _controller;
  late Animation _colorTween;
  late ContentsRepository contentsRepository;
  late bool isMyFavoriteProduct = false;

  @override
  void initState() {
    super.initState();
    _controller = Get.put(ProductDetailController());
    _colorTween = _controller.colorTween;
    contentsRepository = ContentsRepository();
    _loadMyFavoriteContentsState();
  }

  _loadMyFavoriteContentsState() async {
    bool isFavoriteProduct =
        await contentsRepository.isMyFavoriteProducts(widget.data!['pid']);
    // setState
    setState(() {
      isMyFavoriteProduct = isFavoriteProduct;
    });
  }

  @override
  void didChangeDependencies() {
    width = Get.width;
    imgList = [
      widget.data!['image'],
      widget.data!['image'],
      widget.data!['image'],
    ];
    _current = 0;
    super.didChangeDependencies();
  }

  Widget _makeSliderImage() {
    return Container(
      child: Stack(
        children: [
          Hero(
            tag: widget.data!['pid'],
            child: CarouselSlider(
              options: CarouselOptions(
                  height: width,
                  initialPage: 0,
                  enableInfiniteScroll: false,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  }),
              items: imgList.map(
                (img) {
                  return Image.asset(
                    img,
                    width: width,
                    fit: BoxFit.fill,
                  );
                },
              ).toList(),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imgList.asMap().entries.map((entry) {
                // print(entry.key);
                // print(Theme.of(context).brightness);
                return GestureDetector(
                  child: Container(
                    width: 10,
                    height: 10,
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.white)
                          .withOpacity(
                        _current == entry.key ? 0.9 : 0.4,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }

  Widget _sellerSimpleInfo() {
    return Container(
      padding: EdgeInsets.all(15.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20.0,
            backgroundImage: Image.asset('assets/images/user.png').image,
          ),
          SizedBox(width: 10.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ryan',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
              Text(
                '서초구 서초1동',
                style: TextStyle(
                  fontSize: 12.0,
                ),
              ),
            ],
          ),
          Expanded(
            child: MannerTemperature(
              mannerTemp: 39.6,
            ),
          ),
        ],
      ),
    );
  }

  Widget _line() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Divider(
        height: 5.0,
        color: Colors.grey.shade400,
      ),
    );
  }

  Widget _contentDetail() {
    return Container(
      padding: EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            widget.data!['title'],
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
          SizedBox(height: 10.0),
          Row(
            children: [
              Text(
                '디지털기기',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontSize: 11.0,
                  color: Colors.grey.shade600,
                ),
              ),
              Text(
                ' · 끌올 2주 전',
                style: TextStyle(
                  fontSize: 11.0,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
          SizedBox(height: 15.0),
          Text(
            '2018 베스트 부츠 고급형 팝니다. 거의 새 거\n두 번 신었어요\n코로나로 인해 택배 거래만 가능합니다',
            style: TextStyle(
              fontSize: 15.0,
              height: 1.5,
            ),
          ),
          SizedBox(height: 15.0),
          Text(
            '채팅 3 · 관심 17 · 조회 295',
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 15.0),
        ],
      ),
    );
  }

  Widget _reportButton() {
    return Container(
      margin: EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GestureDetector(
            onTap: () {
              print('report');
            },
            child: Text(
              '이 게시글 신고하기',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _otherSellingContent() {
    return Container(
      padding: EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Ryan님의 판매 상품',
            style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
          ),
          Text(
            '더보기',
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _bodyWidget() {
    return CustomScrollView(
      controller: _controller.scrollController,
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate(
            [
              _makeSliderImage(),
              _sellerSimpleInfo(),
              _line(),
              _contentDetail(),
              _line(),
              _reportButton(),
              _line(),
              _otherSellingContent(),
            ],
          ),
        ),
        OtherSellingContentList(),
      ],
    );
  }

  Widget _bottomBarWidget() {
    return Container(
      width: width,
      height: 60,
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey.withOpacity(0.2)),
        ),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () async {
              if (isMyFavoriteProduct) {
                await contentsRepository
                    .deleteMyFavoriteProduct(widget.data!['pid']);
              } else {
                await contentsRepository.addMyFavoriteProduct(widget.data!);
              }

              setState(() {
                isMyFavoriteProduct = !isMyFavoriteProduct;
              });

              if (isMyFavoriteProduct) {
                scaffoldMessengerKey.currentState?.showSnackBar(
                  SnackBar(
                    behavior: SnackBarBehavior.floating,
                    margin: EdgeInsets.fromLTRB(10.0, 0, 10.0, 20.0),
                    duration: Duration(
                      milliseconds: 3000,
                    ),
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '관심목록에 추가되었어요.',
                          style: TextStyle(fontSize: 12.0),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(
                              () => InterestingProduct(
                                  // isMyFavoriteProduct: isMyFavoriteProduct,
                                  ),
                            );
                          },
                          child: Text(
                            '관심목록보기',
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFFF8A3D),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
            },
            child: SvgPicture.asset(
              isMyFavoriteProduct
                  ? 'assets/svg/heart_on.svg'
                  : 'assets/svg/heart_off.svg',
              width: 18,
              height: 18,
              color: isMyFavoriteProduct
                  ? Color(0xFFFF8A3D)
                  : Colors.grey.shade800,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15.0),
            height: 40.0,
            width: 1.0,
            color: Colors.black.withOpacity(0.1),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DataUtils.calcStringToWon(widget.data!['price']),
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '가격제안불가',
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.grey.shade800,
                ),
              ),
            ],
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    '채팅으로 거래하기',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFFF8A3D),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _makeIcon(IconData icon) {
    return AnimatedBuilder(
      animation: _colorTween,
      builder: (context, child) => Icon(
        icon,
        color: _colorTween.value,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Get.put(InterestingProductController());
    return Obx(
      () => ScaffoldMessenger(
        key: scaffoldMessengerKey,
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            // withAlpha(0~255)
            backgroundColor: Colors.white
                .withAlpha(_controller.scrollPositionToAlpha.toInt()),
            elevation: 0,
            leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: _makeIcon(Icons.arrow_back)),
            actions: [
              IconButton(
                  onPressed: () {
                    print('공유하기');
                  },
                  icon: _makeIcon(Icons.ios_share)),
              IconButton(
                  onPressed: () {
                    print('옵션');
                  },
                  icon: _makeIcon(Icons.more_vert)),
            ],
          ),
          body: _bodyWidget(),
          bottomNavigationBar: _bottomBarWidget(),
        ),
      ),
    );
  }
}
