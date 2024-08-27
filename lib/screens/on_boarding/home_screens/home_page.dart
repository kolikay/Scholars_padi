import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';
import 'package:scholars_padi/constants/appColor.dart';
import 'package:scholars_padi/constants/app_state_constants.dart';
import 'package:scholars_padi/routes/page_routes.dart';
import 'package:scholars_padi/widgets/reusesable_widget/normal_text.dart';
import 'package:scholars_padi/widgets/reusesable_widget/reuseable_appbar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:internet_file/internet_file.dart';
import 'homepage_constant_widgets.dart';

class HomePageScreen extends ConsumerStatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  static const String id = 'homepage_screen';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends ConsumerState<HomePageScreen> {
  GlobalKey<ScaffoldState> scafoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    //user data update notifire
    final userApiData = ref.watch(userProvider);
    final notes = ref.watch(noteViewModelProvider);

    return Scaffold(
      key: scafoldKey,
      drawer: Container(
        color: AppColor.darkContainer,
        height: 821.h,
        width: 290.w,
        child: Column(
          children: [
            Container(
              height: 20,
              color: AppColor.mainColor,
            ),
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
                      userApiData.profilePhoto != null
                          ? Container(
                              height: 85.h,
                              width: 85.w,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image:
                                      NetworkImage(userApiData.profilePhoto!),
                                ),
                              ),
                            )
                          : Container(
                              height: 85.h,
                              width: 85.w,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                    'assets/images/homepageimage.png',
                                  ),
                                ),
                              ),
                            ),
                      SizedBox(
                        height: 8.h,
                      ),
                      NormalText(
                        text: userApiData.fullname ?? '',
                        size: 19.2.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      NormalText(
                        text: userApiData.email ?? '',
                        size: 12.sp,
                        fontWeight: FontWeight.w300,
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
            DrawerIcons(
              onPressed: () {
                pushOnBoardingScreen(context);
              },
              icon: Icons.house,
              imageName: 'Home',
            ),
            SizedBox(
              height: 22.h,
            ),
            DrawerIcons(
              onPressed: () {
                pushCategoriesPage(context);
              },
              icon: Icons.extension,
              imageName: 'Categories',
            ),
            SizedBox(
              height: 22.h,
            ),
            DrawerIcons(
              onPressed: () {
                pushSettingsScreen(context);
              },
              icon: Icons.settings,
              imageName: 'Settings',
            ),
            SizedBox(
              height: 22.h,
            ),
            DrawerIcons(
              icon: Icons.share,
              imageName: 'Share',
            ),
            SizedBox(
              height: 22.h,
            ),
            DrawerIcons(
              onPressed: () {
                pushAboutUsScreen(context);
              },
              icon: Icons.category_outlined,
              imageName: 'About App',
            ),
            SizedBox(
              height: 22.h,
            ),
            DrawerIcons(
              onPressed: () {
                pushLogOutScreen(context);
              },
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
                height: 50.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 8.0.w,
                ),
                child: ReuseableAppbar(
                  color: Colors.black,
                  firstAppIcon: Icons.menu,
                  secondAppIcon: Icons.search,
                  firstButton: () {
                    scafoldKey.currentState!.openDrawer();
                  },
                  secondButton: () {
                    pushCatergoriesSearchScreen(context);
                  },
                ),
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
                            HomeConstants.newInkwell(context, 'Material',
                                'assets/images/material.png', () {
                              pushMaterialScreen(context);
                            }),
                            HomeConstants.newInkwell(context, 'Past Question',
                                'assets/images/pastQuestion.png', () {}),
                            HomeConstants.newInkwell(context, 'Scheduler',
                                'assets/images/schduler.png', () {}),
                            HomeConstants.newInkwell(context, 'Note Book',
                                'assets/images/notebook.png', () {
                              //get saved note from server and display on note screen 1
                              notes.getSavedNotes(context);
                              pushNoteBookScreen1(context);
                            }),
                            HomeConstants.newInkwell(context, 'Scholarships',
                                'assets/images/scholaship.png', () {
                              pushScholarshipScreen(context);
                            }),
                            HomeConstants.newInkwell(context, 'Notice Boards',
                                'assets/images/noticeBoard.png', () {
                              pushNoticeScreen(context);
                            }),
                            HomeConstants.newInkwell(context, 'Chats',
                                'assets/images/chat.png', () {}),
                            HomeConstants.newInkwell(
                                context, 'More', 'assets/images/more.jpg', () {
                              pushCategoriesPage(context);
                            }),
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
                      date: '2nd january, 2022',
                      note: 'Added New Notes',
                    ),
                    const ReuseableCards(
                      date: '5th My, 2022',
                      note: 'Visited, www.eportal.oauife.edu.ng',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
