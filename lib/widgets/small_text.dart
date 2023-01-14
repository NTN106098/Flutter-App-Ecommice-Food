import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  SmallText({Key? key,
    required this.text,
    this.color = const Color(0xffa4a1a1),
    this.size =12,
    this.height = 1.2
    }) : super(key: key);
  final String text;
  final Color? color;
  double size;
  double height;


  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      // maxLines: 1,
      style: TextStyle(
          fontFamily: "Roboto",
          color: color,
          fontSize: size,
          height: height
      ),
    );
  }
}
