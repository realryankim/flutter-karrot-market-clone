import 'package:carrot_market_clone/pages/product_detail.dart';
import 'package:carrot_market_clone/controller/home_controller.dart';
import 'package:carrot_market_clone/utils/data_utils.dart';
import 'package:carrot_market_clone/utils/tool_tip_shape.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final HomeController controller = Get.put(HomeController());

  Widget _makeDataList(List<Map<String, dynamic>> datas) {
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
                      tag: datas[index]['cid'],
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
                          Text(
                            datas[index]['title'],
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 15.0),
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
        future: controller.loadContents(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('데이터 오류'));
          }
          if (snapshot.hasData) {
            // AsyncSnapshot<Object?>을 List<Map<String, dynamic>>로 형변환
            return _makeDataList(snapshot.data as List<Map<String, dynamic>>);
          }
          return Center(
            child: Text('해당 지역에 데이터가 없습니다.'),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: () {},
          child: PopupMenuButton<String>(
            offset: Offset(0, 38),
            shape: TooltipShape(),
            onSelected: (String where) {
              controller.changeLocation(where);
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(value: 'ara', child: Text('아라동')),
                PopupMenuItem(value: 'ora', child: Text('오라동')),
                PopupMenuItem(
                    value: 'setting_neighborhood', child: Text('내 동네 설정하기')),
              ];
            },
            child: Obx(
              () => Row(
                children: [
                  Text(controller.locationTypeToString[
                      controller.currentLocation!.value]!),
                  controller.openOtherLocal
                      ? Icon(Icons.keyboard_arrow_up_rounded)
                      : Icon(Icons.keyboard_arrow_down_rounded),
                ],
              ),
            ),
          ),
        ),
        elevation: 1.0,
        actions: [
          IconButton(
            onPressed: () {
              print('상품 검색');
            },
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              print('카테고리');
            },
            icon: Icon(Icons.tune),
          ),
          IconButton(
            onPressed: () {
              print('알림');
            },
            icon: SvgPicture.asset(
              'assets/svg/bell.svg',
              width: 22,
            ),
          ),
        ],
      ),
      body: _bodyWidget(),
    );
  }
}
