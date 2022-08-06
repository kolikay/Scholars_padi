// ignore_for_file: non_constant_identifier_names


import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scholars_padi/screens/authentication/auth_view_models/auth_view_model.dart';
import 'package:scholars_padi/screens/on_boarding/notifications/view_models/notification_view_model.dart';
import 'package:scholars_padi/screens/on_boarding/profile_screens/profile_view_model/profile_view_model.dart';



final authViewModelProvider = ChangeNotifierProvider<AuthViewModel>((ref) {
  return AuthViewModel();
});



final profileViewModelProvider =
    ChangeNotifierProvider<ProfileModelView>((ref) {
  return ProfileModelView();
});




// Update state and notify Notification screen app bar
final notificationProvider = ChangeNotifierProvider<NotificationViewModel>((ref) {
  return NotificationViewModel();
});


