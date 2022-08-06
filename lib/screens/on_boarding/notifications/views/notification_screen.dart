import 'package:flutter/material.dart';
import 'package:scholars_padi/constants/appColor.dart';
import 'package:scholars_padi/constants/app_state_constants.dart';
import 'package:scholars_padi/screens/on_boarding/notifications/views/notifications_all_cards.dart';
import 'package:scholars_padi/widgets/reusesable_widget/reusable_app_bar1.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scholars_padi/widgets/reusesable_widget/normal_text.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class NotificationScreen extends ConsumerStatefulWidget {
  const NotificationScreen({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _NotificationScreenState();
}

class _NotificationScreenState extends ConsumerState<NotificationScreen> {


  @override
  Widget build(BuildContext context) {
    final notificationViewModelForAppBar = ref.watch(notificationProvider);
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(103.h),
          child: ReuseableAppBar1(
            backGroundColor: notificationViewModelForAppBar.selectedList.isEmpty
                ? Colors.grey
                : AppColor.mainColor,
            title: NormalText(
              text: 'Notifications',
              color: Colors.white,
            ),
            firstAppIcon: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios),
            ),
            secondAppIcon: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(24.0.h),
          child:const NotificationAllCards()
        ));
  }
}
