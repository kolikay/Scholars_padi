// import 'package:dio/dio.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';
// import 'package:scholars_padi/screens/authentication/auth_view_models/auth_view_model.dart';

// import 'auth_test.mocks.dart';

// // To stub any method; gives error when used for futures or stream
// // when(mock.method()).thenReturn(value);

// // To stub method that return a future or stream
// // when(mock.method()).thenAnswer(() => futureOrStream);

// // To stub error
// // when(mock.method()).thenThrow(errorObject);

// class MockContext extends Mock implements BuildContext {}

// @GenerateMocks([Dio])
// void main() {
//   MockDio mockDio = MockDio();

//   late AuthViewModel auth;
//   var cont;

//   setUp(() {
//     auth = AuthViewModel.instance;
//   });

//   test('Successfully logged in user', () async {
//     // Stubbing
//     when(mockDio.post(
//       'http://44.204.69.28/api/account/login/',
//       data: {"email": "kolikay1989@gmail.com", "password": "password"},
//     )).thenAnswer(
//       (inv) => Future.value(Response(
//         statusCode: 200,
//         data: {'token': 'ASjwweiBE'},
//         requestOptions: RequestOptions(path: 'http://44.204.69.28/api/account/login/'),
//       )),
//     );

//     expect(
//       await auth.loginUser('http://44.204.69.28/api/account/login/',
//           {"email": "kolikay1989@gmail.com", "password": "password"}, cont),
//       true,
//     );
//   });
// }
























// // import 'dart:ffi';
// // import 'dart:io';

// // import 'package:flutter/cupertino.dart';
// // import 'package:flutter_test/flutter_test.dart';
// // import 'package:mockito/mockito.dart';
// // import 'package:scholars_padi/constants/app_state_constants.dart';
// // import 'package:scholars_padi/models/models.dart';
// // import 'package:scholars_padi/screens/authentication/auth_view_models/auth_view_model.dart';

// // class MockAuth extends Mock implements AuthViewModel {}

// // class MockCont extends Mock implements BuildContext {}

// // void main() {
// //   final _mockAuth = MockAuth();
// //   final conte = MockCont();

// //   setUp(() {});
// //   tearDown(() {});

// //   test(
// //     'Test Login User',
// //     () async {
// //       when(
// //         _mockAuth.loginUser(
// //             'http://44.204.69.28/api/account/login/',
// //             {
// //               "email": "kolikay1989@gmail.com",
// //               "password": "password",
// //             },
// //             conte),
// //       ).thenAnswer((realInvocation) => throw const HttpException('Something went wrong'));

// //       expect(
// //           await _mockAuth.loginUser(
// //               'http://44.204.69.28/api/account/login/',
// //               {
// //                 "email": "kolikay1989@gmail.com",
// //                 "password": "password",
// //               },
// //               conte),
// //           "Success");
// //     },
// //   );

// //     test(
// //     'Test Login User Error',
// //     () async {
// //       when(
// //         _mockAuth.loginUser(
// //             'http://44.204.69.28/api/account/login/',
// //             {
// //               "email": "kolikay1989@gmail.com",
// //               "password": "password",
// //             },
// //             conte),
// //       ).thenAnswer((realInvocation) => throw const HttpException('Something went wrong'));

// //       expect(
// //           await _mockAuth.loginUser(
// //               'http://44.204.69.28/api/account/login/',
// //               {
// //                 "email": "kolikay1989@gmail.com",
// //                 "password": "password",
// //               },
// //               conte),
// //           "Something went wrong");
// //     },
// //   );
// // }
