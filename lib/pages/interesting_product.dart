import 'package:carrot_market_clone/controller/interesting_product_controller.dart';
import 'package:carrot_market_clone/pages/product_detail.dart';
import 'package:carrot_market_clone/repository/contents_repository.dart';
import 'package:carrot_market_clone/utils/data_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class InterestingProduct extends StatefulWidget {
  // bool isMyFavoriteProduct;

  InterestingProduct({
    Key? key,
    // required this.isMyFavoriteProduct,
  }) : super(key: key);

  @override
  _InterestingProductState createState() => _InterestingProductState();
}

class _InterestingProductState extends State<InterestingProduct> {
  late ContentsRepository contentsRepository;

  @override
  void initState() {
    contentsRepository = ContentsRepository();
    super.initState();
  }

  Widget _makeDataList(List<dynamic> datas) {
    return ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        itemBuilder: (BuildContext _context, int index) {
          return GestureDetector(
            onTap: () {
              Get.to(
                () => ProductDetail(
                  data: datas[index],
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                    child: Hero(
                      tag: datas[index]['pid'],
                      child: Image.asset(
                        datas[index]['image'],
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left: 20.0),
                      height: 100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                datas[index]['title'],
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 15.0),
                              ),
                              // GestureDetector(
                              //   onTap: () {
                              //     // needs to refactor to remove each interesting product
                              //     setState(() {
                              //       widget.isMyFavoriteProduct =
                              //           !widget.isMyFavoriteProduct;
                              //     });
                              //   },
                              //   child: SvgPicture.asset(
                              //     widget.isMyFavoriteProduct
                              //         ? 'assets/svg/heart_on.svg'
                              //         : 'assets/svg/heart_off.svg',
                              //     width: 18,
                              //     height: 18,
                              //     color: widget.isMyFavoriteProduct
                              //         ? Color(0xFFFF8A3D)
                              //         : Colors.grey.shade800,
                              //   ),
                              // ),
                            ],
                          ),
                          SizedBox(height: 5.0),
                          Text(
                            datas[index]['location'],
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 12.0,
                                color: Colors.black.withOpacity(0.3)),
                          ),
                          SizedBox(height: 5.0),
                          Text(
                            DataUtils.calcStringToWon(datas[index]['price']),
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          Expanded(
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  SvgPicture.asset(
                                    'assets/svg/heart_off.svg',
                                    width: 13,
                                    height: 13,
                                  ),
                                  SizedBox(width: 5.0),
                                  Text(datas[index]['likes']),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext _context, int index) {
          return Container(height: 1, color: Colors.black.withOpacity(0.1));
        },
        itemCount: datas.length);
  }

  Widget _bodyWidget() {
    return FutureBuilder(
        future: loadInterestingProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('데이터 오류'));
          }
          if (snapshot.hasData) {
            // AsyncSnapshot<Object?>을 List<Map<String, dynamic>>로 형변환
            return _makeDataList(snapshot.data as List<dynamic>);
          }
          return Center(
            child: Text('해당 지역에 데이터가 없습니다.'),
          );
        });
  }

  Future<List<dynamic>?> loadInterestingProducts() async {
    return await contentsRepository.loadFavoriteProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '관심목록',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: _bodyWidget(),
    );
  }
}
