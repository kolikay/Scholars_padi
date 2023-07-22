// ignore_for_file: non_constant_identifier_names

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scholars_padi/models/models.dart';
import 'package:scholars_padi/screens/authentication/auth_view_models/auth_view_model.dart';
import 'package:scholars_padi/screens/note_book_screens/note_book_view_model/note_book_view_model.dart';
import 'package:scholars_padi/screens/on_boarding/notifications/notifications_view_models/notification_view_model.dart';

import 'package:scholars_padi/screens/on_boarding/profile_screens/profile_view_model/profile_view_model.dart';






const baseApi = 'https://scholarspadi.com/api';


//auth view providers
final authViewModelProvider = ChangeNotifierProvider<AuthViewModel>((ref) {
  return AuthViewModel.instance;
});

//note view providers
final noteViewModelProvider = ChangeNotifierProvider<NoteViewModel>((ref) {
  return NoteViewModel.instance;
});



final profileViewModelProvider =
    ChangeNotifierProvider<ProfileModelView>((ref) {
  return ProfileModelView();
});

// Update state and notify Notification screen app bar
final notificationProvider =
    ChangeNotifierProvider<NotificationViewModel>((ref) {
  return NotificationViewModel();
});


//provider for logged in user api data
final userProvider = Provider<UserModel>((ref) {
  return AuthViewModel.instance.userApiData;
});
