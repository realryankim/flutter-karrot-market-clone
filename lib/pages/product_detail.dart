import 'package:carousel_slider/carousel_slider.dart';
import 'package:carrot_market_clone/components/manner_temperature.dart';
import 'package:flutter/material.dart';
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
  late List<String> imgList;
  late int _current;
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
            tag: widget.data!['cid'],
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

  Widget _bodyWidget() {
    return Column(
      children: [
        _makeSliderImage(),
        _sellerSimpleInfo(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Divider(
            height: 5.0,
            color: Colors.grey.shade400,
          ),
        ),
      ],
    );
  }

  Widget _bottomBarWidget() {
    return Container(
      width: width,
      height: 55,
      color: Color(0xFFFF8A3D),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.ios_share,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_vert,
                color: Colors.white,
              )),
        ],
      ),
      body: _bodyWidget(),
      bottomNavigationBar: _bottomBarWidget(),
    );
  }
}