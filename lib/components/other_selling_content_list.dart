import 'package:flutter/material.dart';

class OtherSellingContentList extends StatelessWidget {
  OtherSellingContentList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.fromLTRB(15.0, 0, 15.0, 15.0),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
        ),
        delegate: SliverChildListDelegate(
          List.generate(
            4,
            (index) {
              return Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(6.0),
                        child: Container(color: Colors.grey, height: 120)),
                    SizedBox(height: 8.0),
                    Text(
                      '폴로 원피스',
                      style: TextStyle(fontSize: 14.0),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      '23,000원',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
