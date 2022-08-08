import 'package:flutter/material.dart';
import '../models/notification_model.dart';

class NotificationViewModel extends ChangeNotifier {
  List<NotificationCardsModel> noticeCard = [
    const NotificationCardsModel(
        cardMessage:
            'As a result of the ongoing protest, the management of Obafemi Awolowo University shut down the school till further notice...',
        cardDate: '18/08/2022',
        cardTime: '11:05pm',
        cardTitle: 'OAU management shutdown school'),
    const NotificationCardsModel(
        cardMessage:
            'As a result of the ongoing protest, the management of Obafemi Awolowo University shut down the school till further notice...',
        cardDate: '18/08/2022',
        cardTime: '11:05pm',
        cardTitle: 'new messges'),
    const NotificationCardsModel(
        cardMessage:
            'As a result of the ongoing protest, the management of Obafemi Awolowo University shut down the school till further notice...',
        cardDate: '18/08/2022',
        cardTime: '11:05pm',
        cardTitle: 'OAU management shutdown school'),
    const NotificationCardsModel(
        cardMessage:
            'As a result of the ongoing protest, the management of Obafemi Awolowo University shut down the school till further notice...',
        cardDate: '18/08/2022',
        cardTime: '11:05pm',
        cardTitle: 'OAU management shutdown school'),
    const NotificationCardsModel(
        cardMessage:
            'As a result of the ongoing protest, the management of Obafemi Awolowo University shut down the school till further notice...',
        cardDate: '18/08/2022',
        cardTime: '11:05pm',
        cardTitle: 'new messges'),
    const NotificationCardsModel(
        cardMessage:
            'As a result of the ongoing protest, the management of Obafemi Awolowo University shut down the school till further notice...',
        cardDate: '18/08/2022',
        cardTime: '11:05pm',
        cardTitle: 'OAU management shutdown school'),
  ];
  List<NotificationCardsModel> selectedList = [];

  void addSelectedList(NotificationCardsModel cards) {
    selectedList.add(cards);
    notifyListeners();
  }

  void deleteSelectedList(NotificationCardsModel cards) {
    selectedList.remove(cards);
    notifyListeners();
  }
}
