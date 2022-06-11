import 'package:flutter/material.dart';
import 'package:scholars_padi/constants/appColor.dart';
import 'package:scholars_padi/widgets/normal_text.dart';

class ReuseableButton extends StatelessWidget {
  final String text;
  final GestureTapCallback onPressed;
  final double? width;
  final double? height;
 final double textSize;

  const ReuseableButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      this.height=50,
      this.textSize=16,
      this.width=327})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0,0.0 ),
      height: height,
      width: width,
      child: TextButton(
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            backgroundColor: AppColor.mainColor,
            minimumSize: const Size.fromHeight(70),
            primary: Colors.white,
          ),
          onPressed: onPressed,
          child: NormalText(
            size: textSize,
            color: Colors.white,
            fontWeight: FontWeight.normal,
            text: text,
          )),
    );
  }
}
