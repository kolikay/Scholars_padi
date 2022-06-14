import 'package:flutter/material.dart';
import 'package:scholars_padi/widgets/normal_text.dart';
import 'package:scholars_padi/widgets/reuseable_button.dart';

class ReuseableInfoWidget extends StatelessWidget {
  final String logo;
  final String maintext;
  final String detailsText;
  final String bottonText;
  final GestureTapCallback onPressed;


  const ReuseableInfoWidget(
      {Key? key,
      required this.logo,
      required this.maintext,
      required this.detailsText,
      required this.bottonText,
      required this.onPressed,
})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              height: 140,
              width: 140,
              child: Image.asset(
                logo,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(
              height: 42,
            ),
            NormalText(
              text: maintext,
              size: 23,
              fontWeight: FontWeight.w600,
            ),
            const SizedBox(
              height: 28,
            ),
            Container(
              padding: const EdgeInsets.all(18),
              child: NormalText(text: detailsText, size: 14,),
            ),  const SizedBox(
              height: 48,
            ),
            ReuseableButton(text: bottonText,textSize: 14, onPressed: onPressed),
          ],
        ),
      ),
    );
  }
}
