import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'gift_list.dart';
import 'Voucher.dart';
import 'Gift.dart';

class VoucherItem extends StatelessWidget {
  final Voucher voucher;
  VoucherItem({required this.voucher});
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
          ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(12), // Image border
              child: SizedBox.fromSize(
                size: Size.square(54), // Image radius
                child: Image.network(
                    'https://content.instructables.com/FCH/29A4/K8ZZOIBW/FCH29A4K8ZZOIBW.jpg?auto=webp&fit=bounds&frame=1&height=1024&width=1024auto=webp&frame=1&height=150',
                    fit: BoxFit.cover),
              ),
            ),
            title: Text(voucher.name,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            subtitle: Text('1000 điểm'),
            trailing: IconButton(
              icon: Icon(Icons.arrow_forward),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
    return card;
  }
}

class VoucherList extends StatelessWidget {
  static String title = "Quà tặng từ Nhà tài trợ";
  final List<Voucher> vouchers;
  VoucherList({required this.vouchers, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var list = ListView.builder(
      itemCount: vouchers.length,
      itemBuilder: (context, index) {
        return Container(
          child: VoucherItem(voucher: vouchers[index]),
        );
      },
    );
    return list;
  }
}

class PointTrackingPage extends StatelessWidget {
  final List<Voucher> vouchers;
  final List<Gift> gifts;
  static String title = "Đổi điểm";
  PointTrackingPage({super.key, @required vouchers, @required gifts})
      : vouchers = vouchers,
        gifts = gifts;

  @override
  Widget build(BuildContext context) {
    var imageStack = Stack(
      children: [
        const Image(
          image: AssetImage('images/love_the_earth_1.png'),
          height: 225,
          width: 600,
        ),
        Positioned(
          child: IconButton(icon: Icon(Icons.clear), onPressed: () {
            Navigator.pop(context);
          }),
          top: 0,
          right: 10,
        ),
      ],
    );
    var backPage = Container(
      padding: EdgeInsets.symmetric(vertical: 40),
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          child: imageStack,
        ),
      ),
    );
    var voucherList = VoucherList(vouchers: vouchers);
    var titleWidget = Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Colors.grey.shade200,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Text(
            PointTrackingPage.title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Spacer(),
          Image.asset('images/point_icon.png', height: 24),
          SizedBox(width: 10),
          Text(
            "1000",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
    var mainContent = Container(
      width: 400,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 0,
            blurRadius: 4,
            offset: Offset(0, -7), // changes position of shadow
          ),
        ],
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: 400,
          child: Column(
            children: [
              titleWidget,
              SizedBox(height: 10),
              Text("Đổi quà",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              SizedBox(child: GiftList(gifts: gifts), height: 200),
              Text("Quà tặng từ nhà tài trợ",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              SizedBox(
                child: VoucherList(vouchers: vouchers),
                height: 200,
              ),
            ],
          ),
        ),
      ),
    );

    return Expanded(
      child: Stack(
        children: [
          backPage,
          Column(children: [
            Expanded(child: SizedBox(), flex: 2),
            Expanded(flex: 5, child: mainContent)
          ]),
        ],
      ),
    );
  }
}
