import 'package:carrot_market_clone/controller/my_karrot_controller.dart';
import 'package:carrot_market_clone/widgets/my_karrot/my_karrot_divider.dart';
import 'package:carrot_market_clone/widgets/my_karrot/my_karrot_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyKarrotListView extends GetView<MyKarrotController> {
  MyKarrotListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: controller.myKarrotListOptions.length,
        itemBuilder: (BuildContext context, int index) {
          final String myKarrotListViewItem =
              controller.myKarrotListOptions[index];
          return Container(
            color: Colors.white,
            child: Column(
              children: [
                MyKarrotListViewItem(
                  iconName: controller.myKarrotListIconOptions[index],
                  optionName: controller.myKarrotListOptions[index],
                  onTap: () {
                    controller.myKarrotListViewOnTap(myKarrotListViewItem);
                  },
                ),
                if (myKarrotListViewItem == "관심 카테고리 설정" ||
                    myKarrotListViewItem == "동네 생활 댓글" ||
                    myKarrotListViewItem == "지역광고" ||
                    myKarrotListViewItem == "앱 설정")
                  MyKarrotDivider(),
              ],
            ),
          );
        },
      ),
    );
  }
}
