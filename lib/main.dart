
import 'package:flutter/material.dart';
import 'package:scholars_padi/screens/authentication/views/login_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scholars_padi/screens/landing_page_screens/landing_page.dart';
import 'package:scholars_padi/screens/on_boarding/home_screens/categories_page.dart';
import 'package:scholars_padi/screens/on_boarding/on_boarding_screen.dart';
import 'package:scholars_padi/screens/on_boarding/profile_screens/profile_view/profile_screen.dart';
import 'package:scholars_padi/screens/on_boarding/settings/settings_screen.dart';
import 'screens/authentication/auth_view_models/auth_view_model.dart';
import 'screens/on_boarding/home_screens/categories_search_screen.dart';
import 'screens/on_boarding/home_screens/home_page.dart';
import 'package:flutter/services.dart';
import 'constants/shared_preferences.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

void main() async {
  // add these lines
  WidgetsFlutterBinding.ensureInitialized();

  await UserPreferences.init();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  // run app
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final auth = AuthViewModel.instance;

    bool expired = true;

    String token = UserPreferences.getToken() ?? '';

    if (token.length > 5) {
      
      bool hasExpired = JwtDecoder.isExpired(token);
    
      setState(() {
        expired = hasExpired;
      });
    }

    if (expired == false) {
      auth.getLoginUserData(context);
    }

    //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Scholar Padi',
          theme: ThemeData(
            primarySwatch: Colors.purple,
          ),
          home: const LoginScreen(),
          // home: expired ? const LandingPage() : const OnBoardingScreen(),
          routes: {
            HomePageScreen.id: (context) => const HomePageScreen(),
            CatergoriesSearchScreen.id: (context) =>
                const CatergoriesSearchScreen(),
            CategoriesPage.id: (context) => const CategoriesPage(),
            LoginScreen.id: (context) => const LoginScreen(),
            SettingsScreen.id: ((context) => const SettingsScreen()),
            ProfileScreen.id: ((context) => const ProfileScreen())
          },
        );
      },
    );
  }
}


// void main() {
//   runApp(const ProviderScope(child: MyApp()));
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ScreenUtilInit(
//       builder: (context, child) {
//         return MaterialApp(
//           debugShowCheckedModeBanner: false,
//           title: 'Skill Connect',
//           theme: ThemeData(
//             primarySwatch: Colors.blue,
//           ),
//            home: const LandingPage(),
//         routes: {
//           HomePageScreen.id: (context) => const HomePageScreen(),
//           CatergoriesSearchScreen.id: (context) => const CatergoriesSearchScreen(),
//           CategoriesPage.id: (context) => const CategoriesPage(),
//            OnBoardingScreen.id: (context) => const OnBoardingScreen(),
//            LoginScreen.id: (context) => const LoginScreen(),
//            SettingsScreen.id: ((context) => const SettingsScreen()),
//            ProfileScreen.id: ((context) => const ProfileScreen())
//         },
//         );
//       },
//       designSize: const Size(375, 812),
//     );
//   }
// }












