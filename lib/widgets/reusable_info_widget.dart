import 'package:flutter/material.dart';
import 'package:scholars_padi/screens/auth_screens/login_screen.dart';
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
              height: 50,
            ),
            SizedBox(
              height: 125,
              width: 125,
              child: Image.asset(
                logo,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            NormalText(
              text: maintext,
              size: 24,
              fontWeight: FontWeight.w600,
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.all(18),
              child: NormalText(text: detailsText),
            ),
            ReuseableButton(text: bottonText, onPressed: onPressed),
          ],
        ),
      ),
    );
  }
}
