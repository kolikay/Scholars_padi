import 'package:flutter/material.dart';
import 'package:scholars_padi/constants/appColor.dart';
import 'package:scholars_padi/widgets/reusesable_widget/normal_text.dart';


class ProgressDialog extends StatelessWidget {
 final  String message;
   const ProgressDialog({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 70,
        margin: const EdgeInsets.all(15.0),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Row(
          children: [
            const SizedBox(width: 6.0),
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(AppColor.mainColor),
            ),
            const SizedBox(
              width: 26.0,
            ),
            NormalText(text: message,color: AppColor.mainColor,size: 16, )
          ],
        ),
      ),
    );
  }
}

  //   showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return ProgressDialog(message: 'loading, please wait');
  //       });
