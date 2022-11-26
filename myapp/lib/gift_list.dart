import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'Gift.dart';

class GiftItem extends StatelessWidget {
  final Gift gift;
  const GiftItem({super.key, required this.gift});
  @override
  Widget build(BuildContext context) {
    var subLayout = Row(
      children: [
        Expanded(child: Text("12-12-2003: 0 0")),
        Expanded(child: Text("1000 điểm")),
      ],
    );
    var card = Card(
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              height: 120,
              child: Stack(children: [
                Positioned(
                  top: 10,
                  left: 30,
                  child: Container(
                    width: 200,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12), // Image border
                      child: SizedBox.fromSize(
                        size: Size.square(120), // Image radius
                        child: Image.asset(
                          gift.image,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 20,
                  child: Container(
                    width: 60,
                    child: Column(
                      children: [
                        Container(
                          width: 200,
                          height: 150,
                          child: Column(
                            children: [
                              Text(gift.name,
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                gift.point.toString() + " điểm",
                                style: TextStyle(
                                  color: Colors.lightGreen.shade300,
                                  fontSize: 9,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
            ElevatedButton(onPressed: () {}, child: Text("Nhận")),
          ],
        ));
    return SizedBox(
      width: 200,
      child: card,
    );
  }
}

class GiftList extends StatelessWidget {
  static String title = "Chậu cây";
  final List<Gift> gifts;
  const GiftList({required this.gifts, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var list = ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: gifts.length,
      itemBuilder: (context, index) {
        return Container(
          child: GiftItem(gift: gifts[index]),
        );
      },
    );
    return list;
  }
}
