import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scholars_padi/screens/authentication/auth_view_models/auth_view_model.dart';


final authViewModelProvider = ChangeNotifierProvider<AuthViewModel>((ref) {
  return AuthViewModel();
});