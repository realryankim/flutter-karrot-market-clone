import 'package:carrot_market_clone/pages/home/product_detail.dart';
import 'package:carrot_market_clone/repository/contents_repository.dart';
import 'package:carrot_market_clone/utils/data_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class InterestingProduct extends StatefulWidget {
  InterestingProduct({
    Key? key,
  }) : super(key: key);

  @override
  _InterestingProductState createState() => _InterestingProductState();
}

class _InterestingProductState extends State<InterestingProduct> {
  late ContentsRepository contentsRepository;
  bool isMyFavoriteProduct = false;

  @override
  void initState() {
    super.initState();
    contentsRepository = ContentsRepository();
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
                              Expanded(
                                flex: 12,
                                child: Text(
                                  datas[index]['title'],
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 15.0),
                                ),
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {},
                                  child: SvgPicture.asset(
                                    'assets/svg/heart_off.svg',
                                    width: 18,
                                    height: 18,
                                  ),
                                ),
                              ),
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
            // AsyncSnapshot<Object?>을 List<dynamic>으로 형변환
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
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: GestureDetector(
          onTap: () {},
          child: Text(
            '관심목록',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        elevation: 1.0,
        centerTitle: true,
      ),
      body: _bodyWidget(),
    );
  }
}
