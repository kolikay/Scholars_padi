// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scholars_padi/constants/appColor.dart';
import 'package:scholars_padi/screens/authentication/auth_view_models/auth_view_model.dart';
import 'package:scholars_padi/widgets/reusesable_widget/normal_text.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class LogOutScreen extends ConsumerStatefulWidget {
  const LogOutScreen({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LogOutScreenState();
}

class _LogOutScreenState extends ConsumerState<LogOutScreen> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Exit App'),
      content: const Text('Do you want Log Out?'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: NormalText(
            text: 'No',
            size: 16.sp,
            fontWeight: FontWeight.w600,
             color: AppColor.mainColor,
          ),
        ),
        TextButton(
          onPressed: () => AuthViewModel.instance.logOutUser(context),
          child: NormalText(
            text: 'Yes',
            size: 16.sp,
            fontWeight: FontWeight.w600,
            color: Colors.red,
          ),
        ),
      ],
    );

    // Center(
    //   child: Dialog(
    //     child: SizedBox(
    //       height: 260.h,
    //       child: Padding(
    //         padding: EdgeInsets.symmetric(horizontal: 20.w),
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.center,
    //           children: [
    //             SizedBox(
    //               height: 14.h,
    //             ),
    //             NormalText(
    //               text: 'Log Out',
    //               fontWeight: FontWeight.w500,
    //               size: 30.sp,
    //             ),
    //             SizedBox(
    //               height: 5.h,
    //             ),
    //             Divider(
    //               color: AppColor.dullerBlack,
    //               thickness: 1.h,
    //             ),
    //             SizedBox(
    //               height: 5.h,
    //             ),
    //             NormalText(
    //               text: 'Are you sure ?',
    //               fontWeight: FontWeight.w600,
    //               color: AppColor.dullerBlack,
    //               size: 20.sp,
    //             ),
    //             SizedBox(
    //               height: 5.h,
    //             ),
    //             InkWell(
    //               onTap: () {
    //                 AuthViewModel.instance.logOutUser(context);
    //               },
    //               child: Container(
    //                 width: 220.w,
    //                 height: 50.h,
    //                 decoration: BoxDecoration(
    //                   color: Colors.red,
    //                   borderRadius: BorderRadius.circular(5),
    //                   border: Border.all(color: AppColor.dullBlack),
    //                 ),
    //                 child: Center(
    //                   child: NormalText(
    //                     text: 'Yes',
    //                     fontWeight: FontWeight.w600,
    //                     size: 18.sp,
    //                   ),
    //                 ),
    //               ),
    //             ),
    //             SizedBox(
    //               height: 15.h,
    //             ),
    //             InkWell(
    //               onTap: () {
    //                 Navigator.pop(context);
    //               },
    //               child: Container(
    //                 width: 220.w,
    //                 height: 50.h,
    //                 decoration: BoxDecoration(
    //                     borderRadius: BorderRadius.circular(5),
    //                     border: Border.all(color: AppColor.dullBlack)),
    //                 child: Center(
    //                   child: NormalText(
    //                     text: 'No',
    //                     fontWeight: FontWeight.w600,
    //                      size: 18.sp,
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}
