import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {

static SharedPreferences? _preferences;


  static const keyInitialized = 'init'; //initialize bool for shared pref


//init shared pref package
  static Future init() async => _preferences = await SharedPreferences.getInstance();

//set bool key from funtion to true or false (shows if shared pref has initialize explorescreen)
  static Future setInitialized(bool initialized) async => await _preferences!.setBool(keyInitialized, initialized);

// get key function
  static bool? getInitialized() => _preferences!.getBool(keyInitialized);


  //set usertoken
  static Future setLoginUserId(String id) async => await _preferences!.setString('id', id);
  // get token
  static String? getId() => _preferences!.getString('id');


   //set usertoken
  static Future setUserToken(String userToken) async => await _preferences!.setString('token', userToken);
  // get token
  static String? getUserToken() => _preferences!.getString('token');


  //set userpic
  static Future setUserProfilePix(String token) async => await _preferences!.setString('profilePic', token);

  // get pic
  static String? getUserProfilePix() => _preferences!.getString('profilePic');


    //set usertoken
  static Future setEmail(String email) async => await _preferences!.setString('email', email);
  
  // get token
  static String? getEmail() => _preferences!.getString('email');
 
 static  resetSharedPref() => _preferences!.clear();


}