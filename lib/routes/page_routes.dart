import 'package:flutter/material.dart';
import 'package:scholars_padi/screens/authentication/views/sign_up1_screen.dart';
import 'package:scholars_padi/screens/change_password/email_password_change_screen.dart';
import 'package:scholars_padi/screens/landing_page_screens/no_internet.dart';
import 'package:scholars_padi/screens/material/material_screen1.dart';
import 'package:scholars_padi/screens/note_book_screens/views/nore_book_screen2.dart';
import 'package:scholars_padi/screens/note_book_screens/views/note_book_screen1.dart';
import 'package:scholars_padi/screens/notice_board/notice_screen1.dart';
import 'package:scholars_padi/screens/on_boarding/home_screens/categories_page.dart';
import 'package:scholars_padi/screens/on_boarding/home_screens/categories_search_screen.dart';
import 'package:scholars_padi/screens/on_boarding/home_screens/home_page.dart';
import 'package:scholars_padi/screens/on_boarding/on_boarding_screen.dart';
import 'package:scholars_padi/screens/on_boarding/settings/about_us_screen.dart';
import 'package:scholars_padi/screens/on_boarding/settings/log_out_screen.dart';
import 'package:scholars_padi/screens/on_boarding/settings/notification_screen.dart';
import 'package:scholars_padi/screens/on_boarding/settings/settings_screen.dart';
import 'package:scholars_padi/screens/scholarships/scholaships_main.dart';
import 'package:scholars_padi/screens/school_portal/school_portal.dart';

import '../screens/authentication/views/login_screen.dart';
import '../screens/note_book_screens/views/note_book_screen3.dart';

pushToNoInternetPage(BuildContext context) async {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const NoInternetScreen(),
    ),
  );
}

pushToOnboardingPage(BuildContext context) async {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => const OnBoardingScreen(),
    ),
  );
}

// pushToLoginPage(BuildContext context) async {
//   Navigator.of(context).pushNamed(LoginScreen.id);
// }

pushToLoginPage(BuildContext context) async {
  Navigator.of(context).pushReplacement(
    MaterialPageRoute(
      builder: (context) => const LoginScreen(),
    ),
  );
}




pushOnBoardingScreen(BuildContext context) async {
  Navigator.pushNamed(context, OnBoardingScreen.id);
}

pushCategoriesPage(BuildContext context) async {
  Navigator.pushNamed(context, CategoriesPage.id);
}

pushSettingsScreen(BuildContext context) async {
  Navigator.pushNamed(context, SettingsScreen.id);
}

pushToHomePage(BuildContext context) async {
  Navigator.of(context).pushReplacement(
    MaterialPageRoute(
      builder: (context) => const HomePageScreen(),
    ),
  );
}

pushMaterialScreen(BuildContext context) async {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => const MaterialCardScreen1(),
    ),
  );
}

pushScholarshipScreen(BuildContext context) async {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => const ScholarshipScreen(),
    ),
  );
}

pushAboutUsScreen(BuildContext context) async {
  Navigator.of(context).pushReplacement(
    MaterialPageRoute(
      builder: (context) => const AboutUsScreen(),
    ),
  );
}

pushLogOutScreen(BuildContext context) async {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return const LogOutScreen();
      });
}

pushCatergoriesSearchScreen(BuildContext context) async {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: ((context) => const CatergoriesSearchScreen()),
    ),
  );
}

pushEmailPasswordChangeScreen(BuildContext context) async {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: ((context) => const EmailPasswordChangeScreen()),
    ),
  );
}

pushSignUpScreen1(BuildContext context) async {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: ((context) => const SignUpScreen1()),
    ),
  );
}

pushNoticeScreen(BuildContext context) async {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => const NoticeScreen1(),
    ),
  );
}

pushNotificationScreen(BuildContext context) async {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => const NotificationScreen(),
    ),
  );
}

pushSchoolPortalScreen(BuildContext context) async {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => const SchoolPortal(),
    ),
  );
}

pushNoteBookScreen1(BuildContext context) async {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => const NoteBookScreen1(),
    ),
  );
}

pushNoteBookScreen2(BuildContext context) async {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => const NoteBookScreen2(),
    ),
  );
}

pushNoteBookScreen3(BuildContext context) async {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => const NoteBookScreen3(),
    ),
  );
}
