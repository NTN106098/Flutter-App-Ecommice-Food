import 'package:flutter/material.dart';
import 'package:food_app/utils/dimesions.dart';

class BigText extends StatelessWidget {
  BigText({Key? key,
    required this.text,
    this.color = const Color(0xFF332d2b),
    this.size =0,
    this.overflow=TextOverflow.ellipsis}) : super(key: key);
  final String text;
  final Color? color;
  double size;
  TextOverflow overflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      style: TextStyle(
        fontFamily: 'Roboto',
        color: color,
        fontSize: size==0?Dimensions.font20:size,
        fontWeight: FontWeight.w400
      ),
    );
  }
}
