import 'package:flutter/material.dart';

class NotificationCards {
  final String cardMessage;
  final String cardTitle;
  final String cardDate;
  final String cardTime;
  // final Color? borderColor;
  // final GestureTapCallback onTap;

  const NotificationCards(
      {Key? key,
      required this.cardMessage,
      required this.cardDate,
      required this.cardTime,
      required this.cardTitle,
      // required this.onTap,
      // this.borderColor
      });

  void toggleSelected() {
    // selected = !selected;
  }
}
