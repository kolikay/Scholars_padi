import 'package:flutter/material.dart';

class NotificationViewModel extends ChangeNotifier {
  bool select = false;

  List selectedList = [];

  setSelected() {
    select = !select;
    notifyListeners();
  }


}
