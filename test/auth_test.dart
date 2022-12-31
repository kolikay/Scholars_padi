import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:scholars_padi/constants/app_state_constants.dart';
import 'package:scholars_padi/models/models.dart';
import 'package:scholars_padi/screens/authentication/auth_view_models/auth_view_model.dart';

class MockAuth extends Mock implements AuthViewModel {}

class MockCont extends Mock implements BuildContext {}

void main() {
  final _mockAuth = MockAuth();
  final conte = MockCont();

  setUp(() {});
  tearDown(() {});

  test(
    'Test Login User',
    () async {
      when(
        _mockAuth.loginUser(
            'http://44.204.69.28/api/account/login/',
            {
              "email": "kolikay1989@gmail.com",
              "password": "password",
            },
            conte),
      ).thenAnswer((realInvocation) => "Success");

      expect(
          await _mockAuth.loginUser(
              'http://44.204.69.28/api/account/login/',
              {
                "email": "kolikay1989@gmail.com",
                "password": "password",
              },
              conte),
          "Success");
    },
  );
}
