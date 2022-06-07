import 'package:flutter/material.dart';

class NormalText extends StatelessWidget {
  final Color? color;
  final String text;
  double size;
  TextOverflow overflow;
  FontWeight? fontWeight;

  NormalText(
      {Key? key,
      this.color = const Color(0xff332d2b),
      required this.text,
      this.overflow = TextOverflow.ellipsis,
      this.size = 20,
      this.fontWeight = FontWeight.normal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontSize: size,
          fontWeight: fontWeight,
          fontFamily: 'Roboto',),
    );
  }
}
