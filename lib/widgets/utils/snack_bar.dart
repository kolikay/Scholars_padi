import 'package:flutter/material.dart';
import 'package:scholars_padi/widgets/reusesable_widget/normal_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShowSnackBar {
  // opens snackbar
  static void openSnackBar(BuildContext context, String message,
      String buttontext, GestureTapCallback onPressed) async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(backgroundColor: Colors.black,
      duration: const Duration(seconds: 1),
        content: SizedBox(
          height: 40.h,
          child: Row(
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
      ),
    );
  }




 static buildErrorSnackbar(BuildContext context, String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: color,
        duration: const Duration(seconds: 5),
        content: SizedBox(
          height: 50.h,
          child: NormalText(
            text: message,
            color: Colors.black,
            size: 16.sp,
          ),
        ),
      ),
    );
 }
}


