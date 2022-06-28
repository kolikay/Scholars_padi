import 'dart:io';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:scholars_padi/constants/status_codes.dart';
import 'package:scholars_padi/screens/home_screens/home_page.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:scholars_padi/screens/landing_page_screens/no_internet.dart';

// class UserServices {
//   static Future<dynamic> sendRequest(String url) async {
//     http.Response response = await http.get(Uri.parse(url));
//     try {
//       var connectivityResult = await (Connectivity().checkConnectivity());
//       if (connectivityResult == ConnectivityResult.mobile ||
//           connectivityResult == ConnectivityResult.wifi) {
//         print('ok');
//         if (response.statusCode == 200) {
//           String jsonData = response.body;
//           var decodedData = convert.jsonDecode(jsonData);
//           return decodedData;
//         } else {
//           print('failled');
//           return 'Failed, No Respense';
//         }
//       } else {
//         print('no internet');
//       }
//     } catch (e) {
//       return 'Failed';
//     }
//   }
// }

class UserServices {
  static Future<Object> sendRequest(String url) async {
    print('hehe');
    try {
      var response = await http.get(Uri.parse(USERS_LIST));
      if (response.statusCode == 200) {
        print('hehe');
        return Success(response: 'good work');
      }
      return Failure(
          code: USER_INVALID_RESPONSE, errorResponse: 'Invalid Response');
    } on HttpException {
      print('failed oooooooooooo');
      return Failure(
          code: NO_INTERNET, errorResponse: 'No Internet Connection');
    } on SocketException {
      print('failed ooooo');
      return Failure(
          code: NO_INTERNET, errorResponse: 'No Internet Connection');
    } on FormatException {
      print('failed ooo');
      return Failure(code: INVALID_FORMAT, errorResponse: 'Invalid Format');
    } catch (e) {
      print('failed o');
      return Failure(code: UNKNOWN_ERROR, errorResponse: 'Unknown Error');
    }
  }
}
