// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:scholars_padi/constants/appColor.dart';

import 'package:scholars_padi/screens/on_boarding/notifications/views/notification_screen.dart';
import 'package:scholars_padi/screens/on_boarding/profile_screens/profile_view/profile_screen.dart';
import 'package:scholars_padi/widgets/reusesable_widget/normal_text.dart';
import 'favourites/favourite_main_screen.dart';
import 'home_screens/home_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomePageScreen(),
    const FavouriteScreen(),
    const NotificationScreen(),
    const ProfileScreen()
  ];

  Future<bool> _onWillPop(BuildContext context) async {
    return (await showDialog(
          context: context,
          builder: (context) =>  AlertDialog(
            title:const Text('Exit App'),
            content:const Text('Do you want to exit the app?'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child:NormalText(text: 'No',size: 16.sp, fontWeight: FontWeight.w600,),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: NormalText(text: 'Yes',size: 16.sp, fontWeight: FontWeight.w600,),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onWillPop(context),
      child: Scaffold(
        body: _screens[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white70,
          selectedItemColor: AppColor.mainColor,
          type: BottomNavigationBarType.fixed,
          onTap: (index) => setState(() => _currentIndex = index),
          currentIndex: _currentIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favourite',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'Notification',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}











// class OnBoardingScreen extends StatefulWidget {
//   // static String id = 'onBordingScreen';
//   const OnBoardingScreen({Key? key}) : super(key: key);

//   @override
//   _OnBoardingScreenState createState() => _OnBoardingScreenState();
// }

// class _OnBoardingScreenState extends State<OnBoardingScreen> {
//   // static const String id = 'onBoard';

//   int currentIndex = 0;

//   final screens = [
//     const HomePageScreen(),
//     const FavouriteScreen(),
//     const NotificationScreen(),
//     const ProfileScreen()
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: screens[currentIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         iconSize: 25.0.w,
//         backgroundColor: Colors.white70,
//         selectedItemColor: AppColor.mainColor,
//         type: BottomNavigationBarType.fixed,
//         onTap: (index) => setState(() => currentIndex = index),
//         currentIndex: currentIndex,
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.favorite),
//             label: 'Favourite',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.notifications),
//             label: 'Notification',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'Profile',
//           ),
//         ],
//       ),
//     );
//   }
// }

// class OnBoardingScreen extends StatefulWidget {
//   const OnBoardingScreen({Key? key}) : super(key: key);

//   @override
//   State<OnBoardingScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<OnBoardingScreen> {


//   Future<bool> _onWillPop(BuildContext context) async {
//     return (await showDialog(
//           context: context,
//           builder: (context) => AlertDialog(
//             title:const Text('Exit App'),
//             content:const Text('Do you want to exit the app?'),
//             actions: <Widget>[
//               TextButton(
//                 onPressed: () => Navigator.of(context).pop(false),
//                 child:NormalText(text: 'No',size: 16.sp, fontWeight: FontWeight.w600,),
//               ),
//               TextButton(
//                 onPressed: () => Navigator.of(context).pop(true),
//                 child: NormalText(text: 'Yes',size: 16.sp, fontWeight: FontWeight.w600,),
//               ),
//             ],
//           ),
//         )) ??
//         false;
//   }

//   @override
//   Widget build(BuildContext context) {
//     int currentIndex = 0;

//     final screens = [
//       const HomePageScreen(),
//       const FavouriteScreen(),
//       const NotificationScreen(),
//       const ProfileScreen()
//     ];
//     return WillPopScope(
//         onWillPop: () => _onWillPop(context),
//         child: Scaffold(
//           body: screens[currentIndex],
//           bottomNavigationBar: BottomNavigationBar(
//             iconSize: 25.0.w,
//             backgroundColor: Colors.white70,
//             selectedItemColor: AppColor.mainColor,
//             type: BottomNavigationBarType.fixed,
//             onTap: (index) => setState(() => currentIndex = index),
//             currentIndex: currentIndex,
//             items: const [
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.home),
//                 label: 'Home',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.favorite),
//                 label: 'Favourite',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.notifications),
//                 label: 'Notification',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.person),
//                 label: 'Profile',
//               ),
//             ],
//           ),
//         ));
//   }
// }




