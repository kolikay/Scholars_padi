import 'package:flutter/material.dart';
import 'package:scholars_padi/widgets/reusesable_widget/normal_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShowSnackBar {
  // opens snackbar
  static void openSnackBar(BuildContext context, String message,
      String buttontext, GestureTapCallback onPressed) async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(backgroundColor: Colors.black,
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NormalText(
              text: message,
              color: Colors.white,
              size: 16.sp,
            ),
            TextButton(
              onPressed: onPressed,
              child: NormalText(
                text: buttontext,
                color: Colors.white,
                size: 16.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
