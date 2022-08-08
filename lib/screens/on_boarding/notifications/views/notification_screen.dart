import 'package:flutter/material.dart';
import 'package:scholars_padi/constants/appColor.dart';
import 'package:scholars_padi/constants/app_state_constants.dart';
import 'package:scholars_padi/screens/material/material_screen2.dart';
import 'package:scholars_padi/screens/on_boarding/notifications/notifications_view_models/notification_view_model.dart';
import 'package:scholars_padi/screens/on_boarding/notifications/views/notification_cards.dart';
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
    final notificationViewModel = ref.watch(notificationProvider);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(103.h),
        child: getAppBar(notificationViewModel),
      ),
      body: ListView.builder(
        itemCount: notificationViewModel.noticeCard.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              SizedBox(
                height: 10.h,
              ),
              NotificationMaterialCards(
                cardMessage:
                    notificationViewModel.noticeCard[index].cardMessage,
                cardDate: notificationViewModel.noticeCard[index].cardDate,
                cardTime: notificationViewModel.noticeCard[index].cardTime,
                cardTitle: notificationViewModel.noticeCard[index].cardTitle,
                // receives call back value from child widget and update state
                isSelected: (value) {
                  setState(() {
                    if (value) {
                      notificationViewModel.addSelectedList(
                          notificationViewModel.noticeCard[index]);
                    } else {
                      notificationViewModel.deleteSelectedList(
                          notificationViewModel.noticeCard[index]);
                    }
                  });
                },
              ),
            ],
          );
        },
      ),
    );
  }

  getAppBar(NotificationViewModel notificationViewModel) {
    return notificationViewModel.selectedList.isEmpty
        ? ReuseableAppBar1(
            backGroundColor: AppColor.mainColor,
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
          )
        : ReuseableAppBar1(
            backGroundColor: const Color(0xffBF000001),
            title: NormalText(
              text: "${notificationViewModel.selectedList.length} Selected",
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
              icon: const Icon(Icons.delete,
            ),
          ),
            thirdAppIcon: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.email,
            ),
          ));
  }
}
