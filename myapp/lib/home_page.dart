import 'dart:io';

import 'package:flutter/material.dart';
import 'package:myapp/status_line.dart';

class ButtonWithIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  final onPressed;
  const ButtonWithIcon({
    super.key,
    required this.icon,
    required this.label,
    required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: Icon(icon),
      label: Text(label),
      onPressed: onPressed,
    );
  }
}

class FunctionalButtonGroup extends StatelessWidget {
  const FunctionalButtonGroup({super.key});

  @override
  Widget build(BuildContext context) {
    var main_box_decoration = BoxDecoration(
      border: Border.all(
        width: 1,
        color: Colors.grey.shade200,
      ),
      borderRadius: BorderRadius.circular(12),
    );
    var btn1 = ButtonWithIcon(
        icon: Icons.add,
        label: 'Chia sẻ ảnh',
        onPressed: () {
          print('Chia sẻ ảnh');
        });
    var btn2 = ButtonWithIcon(
        icon: Icons.add,
        label: 'Chia sẻ ảnh',
        onPressed: () {
          print('Chia sẻ ảnh');
        });
    var btn3 = ButtonWithIcon(
        icon: Icons.add,
        label: 'Chia sẻ ảnh',
        onPressed: () {
          print('Chia sẻ ảnh');
        });
    return Container(
      padding: EdgeInsets.all(20),
      decoration: main_box_decoration,
      child: Column(
        children: [
          btn1,
          btn2,
          btn3,
        ],
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class BottomButtonGroup extends StatelessWidget {
  const BottomButtonGroup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var row = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.add),
        ),
        ElevatedButton(
          onPressed: () {},
          child: const Text('Chia sẻ cho bạn bè'),
        ),
      ],
    );

    return Center(
      child: row,
    );
  }
}

class ExitButton extends StatelessWidget {
  const ExitButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var icon_btn = IconButton(
      color: Colors.grey.shade600,
      alignment: Alignment.topRight,
      icon: const Icon(Icons.clear_rounded),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    return Row(
      children: [Spacer(), icon_btn],
    );
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var bottom_section = Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(12),
          bottom: Radius.circular(0),
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Container(
        child: Column(
          children: const [
            FunctionalButtonGroup(),
            StatusLine(),
            BottomButtonGroup(),
          ],
        ),
      ),
    );
    return Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Column(
                children: [
                  ExitButton(),
                  const Image(
                    image: AssetImage("Home.png"),
                  ),
                ],
              ),
            ),
            Expanded(child: bottom_section),
          ],
        ),
      ),
    );
  }
}
