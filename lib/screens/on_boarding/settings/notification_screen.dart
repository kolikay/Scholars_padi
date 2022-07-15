import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scholars_padi/constants/appColor.dart';
import 'package:scholars_padi/widgets/reusesable_widget/reusable_app_bar1.dart';
import 'package:scholars_padi/widgets/reusesable_widget/normal_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scholars_padi/widgets/reusesable_widget/reusesable_appBar2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(103.h),
        child: ReusesableAppBar2(
          appBarTitle: 'Notifications',
          firstButton: IconButton(
            icon: const Icon(Icons.abc),
            onPressed: () {},
          ),
        ),
      ),
      body: Container(
        color: AppColor.darkContainer,
        height: 710,
        child: Column(
          children: [
            NormalText(text: 'Notify Me About'),
            SizedBox(
              height: 24.h,
            ),
            notificationsSwitch('Latest News', false),
            SizedBox(
              height: 24.h,
            ),
            notificationsSwitch('New Materials', false),
            SizedBox(
              height: 24.h,
            ),
            notificationsSwitch('Scheduler', false),
            SizedBox(
              height: 24.h,
            ),
            notificationsSwitch('Chat Messages', false),
            SizedBox(
              height: 24.h,
            ),
          ],
        ),
      ),
    );
  }

  Widget notificationsSwitch(String text, bool value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        NormalText(text: text),
        Platform.isAndroid
            ? Switch(
                value: value,
                onChanged: (newValue) => setState(() => value = newValue),
              )
            : CupertinoSwitch(
                value: value,
                onChanged: (newValue) => setState(() => value = newValue),
              ),
      ],
    );
  }
}
