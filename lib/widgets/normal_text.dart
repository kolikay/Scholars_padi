// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class NormalText extends StatelessWidget {
  final Color? color;
  final String text;
  double size;
  TextOverflow overflow;
  FontWeight? fontWeight;
  TextAlign? textAlign;

  NormalText(
      {Key? key,
      this.color = Colors.black,
      required this.text,
      this.overflow = TextOverflow.ellipsis,
      this.size = 16,
      this.fontWeight = FontWeight.normal,
      this.textAlign,
      
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: fontWeight,
        fontFamily: 'Roboto',
      ),
    );
  }
}
