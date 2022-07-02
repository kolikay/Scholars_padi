import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:scholars_padi/constants/appColor.dart';
import 'package:scholars_padi/screens/home_screens/homepage_constant_widgets.dart';
import 'package:scholars_padi/widgets/reusesable_widget/normal_text.dart';
import 'package:scholars_padi/widgets/reusesable_widget/reuseable_appbar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);
  static const String id = 'homepage_screen';

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  GlobalKey<ScaffoldState> scafoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scafoldKey,
        drawer: Container(
          color: AppColor.darkContainer,
          height: 821.h,
          width: 290.w,
          child: Column(
            children: [
              //drawer top container for image and name
              Stack(
                children: [
                  Container(
                    color: AppColor.mainColor,
                    height: 222.h,
                    width: 290.w,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 62.h,
                        ),
                        Container(
                          height: 85.h,
                          width: 85.w,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                'lib/assets/homepageimage.png',
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        NormalText(
                          text: 'Kolawole',
                          size: 19.2.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        NormalText(
                          text: 'Kolawole@yahoo.com',
                          size: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    top: 20,
                    right: 24,
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.close,
                          size: 34,
                          color: Colors.white,
                        )),
                  )
                ],
              ),
              SizedBox(
                height: 22.h,
              ),
               const DrawerIcons(
                icon: Icons.house,
                imageName: 'House',
              ),
              SizedBox(
                height: 22.h,
              ),
               const DrawerIcons(
                icon: Icons.extension,
                imageName: 'Categories',
              ),
              SizedBox(
                height: 22.h,
              ),
               const DrawerIcons(
                icon: Icons.settings,
                imageName: 'Settings',
              ),
              SizedBox(
                height: 22.h,
              ),
               const DrawerIcons(
                icon: Icons.share,
                imageName: 'Share',
              ),
              SizedBox(
                height: 22.h,
              ),
               const DrawerIcons(
                icon: Icons.category_outlined,
                imageName: 'About App',
              ),
              SizedBox(
                height: 22.h,
              ),
           const   DrawerIcons(
                icon: Icons.logout,
                imageName: 'Logout',
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          dragStartBehavior: DragStartBehavior.start,
          child: Container(
            color: AppColor.darkContainer,
            child: Column(
              children: [
                SizedBox(
                  height: 30.h,
                ),
                ReuseableAppbar(
                  menuPressed: () {
                    scafoldKey.currentState!.openDrawer();
                  },
                  searchPressed: () {},
                ),
                CarouselSlider.builder(
                  options: CarouselOptions(
                    enableInfiniteScroll: false,
                    // enlargeCenterPage: true,
                    viewportFraction: 0.9.w,
                    // autoPlay: true,

                    onPageChanged: (index, reason) =>
                        setState(() => HomeConstants.activeImageIndex = index),
                    autoPlayInterval: const Duration(seconds: 2),
                  ),
                  itemCount: HomeConstants.images.length,
                  itemBuilder: (context, index, realIndex) {
                    final image = HomeConstants.images[index];
                    return HomeConstants.buildImage(image, index);
                  },
                ),
                SizedBox(height: 5.h),
                HomeConstants.buildIndicator(),
                SizedBox(height: 5.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0.w),
                  child: Column(
                    children: [
                      Divider(
                        color: Colors.black26,
                        thickness: 2.0.w,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          NormalText(
                            text: 'Categories',
                            size: 19.2.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                      SizedBox(height: 16.h),
                      Container(
                        width: 343.w,
                        height: 176.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.0.w, vertical: 12.w),
                          child: GridView.count(
                            primary: false,
                            crossAxisSpacing: 1,
                            mainAxisSpacing: 1,
                            crossAxisCount: 4,
                            children: <Widget>[
                              HomeConstants.newInkwell(
                                  context, 'Material', 'lib/assets/material.png'),
                              HomeConstants.newInkwell(context, 'Past Question',
                                  'lib/assets/pastQuestion.png'),
                              HomeConstants.newInkwell(
                                  context, 'Scheduler', 'lib/assets/schduler.png'),
                              HomeConstants.newInkwell(
                                  context, 'Note Book', 'lib/assets/notebook.png'),
                              HomeConstants.newInkwell(context, 'Scholarships',
                                  'lib/assets/scholaship.png'),
                              HomeConstants.newInkwell(context, 'Notice Boards',
                                  'lib/assets/noticeBoard.png'),
                              HomeConstants.newInkwell(
                                  context, 'Chats', 'lib/assets/chats.png'),
                              HomeConstants.newInkwell(
                                  context, 'More', 'lib/assets/more.png'),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Divider(
                        color: Colors.black26,
                        thickness: 2.0.h,
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          NormalText(
                            text: 'Recent Activities',
                            size: 19.2.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                      const ReuseableCards(
                        date: 'jan',
                        note:
                            'jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj',
                      ),
                      const ReuseableCards(
                        date: 'jan',
                        note:
                            'jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
