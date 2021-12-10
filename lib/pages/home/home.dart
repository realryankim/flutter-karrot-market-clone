import 'package:carrot_market_clone/pages/home/product_detail.dart';
import 'package:carrot_market_clone/controller/home_controller.dart';
import 'package:carrot_market_clone/utils/colors.dart';
import 'package:carrot_market_clone/utils/data_utils.dart';
import 'package:carrot_market_clone/utils/tool_tip_shape.dart';
import 'package:carrot_market_clone/widgets/home/app_bar_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class Home extends GetView<HomeController> {
  Home({Key? key}) : super(key: key);

  Widget _makeDataList(List<Map<String, dynamic>> datas) {
    return ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        itemBuilder: (BuildContext _context, int index) {
          return GestureDetector(
            onTap: () {
              Get.to(
                () => ProductDetail(data: datas[index]),
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
    return Obx(
      () => FutureBuilder(
        future: controller.loadContents(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return Center(
                child: CircularProgressIndicator(color: ColorsKM.primary));
          }
          if (snapshot.hasError) {
            return Center(child: Text('데이터 오류'));
          }
          if (snapshot.hasData) {
            // as를 사용해서 AsyncSnapshot<Object?>를 List<Map<String, dynamic>>로 형변환
            return _makeDataList(snapshot.data as List<Map<String, dynamic>>);
          }
          return Center(
            child: Text('해당 지역에 데이터가 없습니다.'),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Get.find<HomeController>();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Obx(
          () => GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              // TODO: 주소 클릭 시, 화살 아이콘 방향 변경
              controller.handlePopupMenuArrowIcon();
            },
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
                    value: 'setting_neighborhood',
                    child: Text('내 동네 설정하기'),
                  ),
                ];
              },
              child: Row(
                children: [
                  Text(
                    controller.locationTypeToString[
                        controller.currentLocation.value]!,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  controller.openOtherLocal.value
                      ? Icon(
                          Icons.keyboard_arrow_up_rounded,
                          color: Colors.black,
                        )
                      : Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: Colors.black,
                        ),
                ],
              ),
            ),
          ),
        ),
        elevation: 1.0,
        actions: [
          AppBarIcon(
            icon: Icons.search,
            onPressed: () {
              // 상품 검색
            },
          ),
          AppBarIcon(
            icon: Icons.tune,
            onPressed: () {
              // 카테고리
            },
          ),
          IconButton(
            onPressed: () {
              // 알림
            },
            icon: SvgPicture.asset(
              'assets/svg/bell.svg',
              width: 22,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: _bodyWidget(),
    );
  }
}
