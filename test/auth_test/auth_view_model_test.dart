import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:scholars_padi/models/models.dart';
import 'package:scholars_padi/screens/authentication/auth_view_models/auth_view_model.dart';

void main() {
  group('Testing ', () {
    var authView = AuthViewModel.instance;
    UserModel userApiData = UserModel();

    test('A new user is added', () {
      authView.addUserdata(userApiData);
      expect(authView.userData.isNotEmpty, true);
    });

  
  });
}
