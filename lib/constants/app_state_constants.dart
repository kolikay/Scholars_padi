
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scholars_padi/screens/authentication/auth_view_models/auth_view_model.dart';
import 'package:scholars_padi/screens/on_boarding/profile_screens/profile_view_model/profile_view_model.dart';

final authViewModelProvider = ChangeNotifierProvider<AuthViewModel>((ref) {
  return AuthViewModel();
});

final profileViewModelProvider =
    ChangeNotifierProvider<ProfileModelView>((ref) {
  return ProfileModelView();
});

// final schoProvider = ChangeNotifierProvider<ScholarshipsViewModel>((ref) {
//   return ScholarshipsViewModel();
// });

// class ScholarshipsViewModel extends ChangeNotifier {
//   bool selected1 = false;
//   bool selected2 = false;

//   setLoading1() async {
//     selected1 = !selected1;
//     notifyListeners();
//   }

//   setLoading2() async {
//     selected2 = !selected2;
//     notifyListeners();
//   }
// }
