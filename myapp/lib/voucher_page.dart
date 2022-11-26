import 'package:flutter/material.dart';
import 'Voucher.dart';

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
      color: Colors.white70,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.add),
            title: Text(voucher.name),
            subtitle: Text('1000 điểm'),
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

class VoucherPage extends StatelessWidget {
  final List<Voucher> vouchers;
  static String title = "Đổi điểm";
  VoucherPage({super.key, @required vouchers}) : vouchers = vouchers;

  @override
  Widget build(BuildContext context) {
    var backPage = Container(
        child: Align(
      alignment: Alignment.topCenter,
      child:
          const Image(image: NetworkImage('https://picsum.photos/250?image=9')),
    ));
    var voucherList = VoucherList(vouchers: vouchers);
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
            color: Colors.black.withOpacity(0.25),
            spreadRadius: 0,
            blurRadius: 4,
            offset: Offset(0, 4), // changes position of shadow
          ),
        ],
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: 400,
          child: Column(
            children: [
              Text(title,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(
                child: VoucherList(vouchers: vouchers),
                height: 400,
              ),
            ],
          ),
        ),
      ),
    );

    return Stack(
      children: [
        backPage,
        mainContent,
      ],
    );
  }
}
