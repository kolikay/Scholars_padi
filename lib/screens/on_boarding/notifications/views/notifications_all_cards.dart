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
        cardTitle: 'OAU management shutdown school')

    // MaterialCards(
    //     onTap: () {},
    //     cardMessage:
    //         'As a result of the ongoing protest, the management of Obafemi Awolowo University shut down the school till further notice...',
    //     cardDate: '18/08/2022',
    //     cardTime: '11:05pm',
    //     cardTitle: 'OAU management shutdown school'),
    // MaterialCards(
    //     onTap: () {},
    //     cardMessage:
    //         'We welcome you into the largest educational platform on campus where students get access to all departments materials/textbooks and other necessary information. Explore through the App and get the best experience so far.Thank You.',
    //     cardDate: '18/08/2022',
    //     cardTime: '11:05pm',
    //     cardTitle: 'Scholar’s Padi'),
    // MaterialCards(
    //     onTap: () {},
    //     cardMessage:
    //         'As a result of the ongoing protest, the management of Obafemi Awolowo University shut down the school till further notice...',
    //     cardDate: '18/08/2022',
    //     cardTime: '11:05pm',
    //     cardTitle: 'OAU management shutdown school'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MaterialCards(
            onTap: () {},
            cardMessage: noticeCard[0].cardMessage,
            cardDate: noticeCard[0].cardDate,
            cardTime: noticeCard[0].cardTime,
            cardTitle: noticeCard[0].cardTitle)
      ],
    );
  }
}
