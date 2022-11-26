import 'package:flutter/material.dart';

// a single status item widget
class StatusPoint extends StatelessWidget {
  final String title;
  final int count;
  final IconData icon;
  const StatusPoint(
      {super.key, @required icon, @required title, @required count})
      : title = title,
        count = count,
        icon = icon;
  @override
  Widget build(BuildContext context) {
    var col = Column(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey.shade600,
          ),
        ),
        Text(
          count.toString(),
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ],
    );

    var row = Row(
      children: [
        Icon(icon),
        col,
      ],
    );

    return Container(
      padding: EdgeInsets.all(10),
      child: row,
    );
  }
}

class StatusLine extends StatelessWidget {
  const StatusLine({super.key});

  @override
  Widget build(BuildContext context) {
    var status1 = StatusPoint(
      icon: Icons.add,
      title: 'Đã trồng',
      count: 10,
    );
    var status2 = StatusPoint(
      icon: Icons.add,
      title: 'Chuỗi',
      count: 10,
    );
    var status3 = StatusPoint(
      icon: Icons.add,
      title: 'Điểm',
      count: 10,
    );

    var row = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        status1,
        status2,
        status3,
      ],
    );

    return Container(
      padding: EdgeInsets.all(10),
      child: row,
    );
  }
}
