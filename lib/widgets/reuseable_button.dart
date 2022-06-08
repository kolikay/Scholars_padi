import 'package:flutter/material.dart';
import 'package:scholars_padi/constants/appColor.dart';
import 'package:scholars_padi/widgets/normal_text.dart';

class ReuseableButton extends StatelessWidget {
  final String text;
  final GestureTapCallback onPressed;
  double? width;
  double? height;
  double size;

  ReuseableButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      this.height,
      this.size=16,
      this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0,0.0 ),
      height: height,
      width: width,
      child: TextButton(
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            backgroundColor: AppColor.mainColor,
            minimumSize: const Size.fromHeight(80),
            primary: Colors.white,
          ),
          onPressed: onPressed,
          child: NormalText(
            size: size,
            color: Colors.white,
            fontWeight: FontWeight.normal,
            text: text,
          )),
    );
  }
}
