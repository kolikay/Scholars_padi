import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scholars_padi/screens/on_boarding/notifications/models/notification_model.dart';

import 'notification_cards.dart';

class NotificationAllCards extends ConsumerStatefulWidget {
  const NotificationAllCards({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _NotificationAllCardsState();
}

class _NotificationAllCardsState extends ConsumerState<NotificationAllCards> {
  List<NotificationCards> noticeCard = [
    const NotificationCards(
        cardMessage:
            'As a result of the ongoing protest, the management of Obafemi Awolowo University shut down the school till further notice...',
        cardDate: '18/08/2022',
        cardTime: '11:05pm',
        cardTitle: 'OAU management shutdown school'),
    const NotificationCards(
        cardMessage:
            'As a result of the ongoing protest, the management of Obafemi Awolowo University shut down the school till further notice...',
        cardDate: '18/08/2022',
        cardTime: '11:05pm',
        cardTitle: 'OAU management shutdown school'),
    const NotificationCards(
        cardMessage:
            'As a result of the ongoing protest, the management of Obafemi Awolowo University shut down the school till further notice...',
        cardDate: '18/08/2022',
        cardTime: '11:05pm',
        cardTitle: 'OAU management shutdown school'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Column(
          children: [
            MaterialCards(
                onTap: () {},
                cardMessage: noticeCard[index].cardMessage,
                cardDate: noticeCard[index].cardDate,
                cardTime: noticeCard[index].cardTime,
                cardTitle: noticeCard[index].cardTitle),
                SizedBox(height: 10.h,),
          ],
        );
      },
      itemCount: noticeCard.length,
    );
  }
}
