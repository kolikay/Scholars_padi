// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class NormalText extends StatelessWidget {
  final Color? color;
  final String text;
  double size = 14;
  TextOverflow overflow;
  FontWeight? fontWeight;
  TextAlign? textAlign;

  NormalText(
      {Key? key,
      this.color = Colors.black,
      required this.text,
      this.overflow = TextOverflow.ellipsis,
      this.size = 14,
      this.fontWeight = FontWeight.normal,
      this.textAlign,
      
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:GoogleFonts.poppins(
        color: color,
        fontSize: size,
        fontWeight: fontWeight
      ),
    
    );
  }
}
