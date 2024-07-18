import 'package:flutter/material.dart';
import 'package:scholars_padi/constants/appColor.dart';
import 'package:scholars_padi/routes/page_routes.dart';
import 'package:scholars_padi/widgets/reusesable_widget/reusable_app_bar1.dart';
import 'package:scholars_padi/widgets/reusesable_widget/normal_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'allfavourite_screen.dart';
import 'material_fav_screen.dart';
import 'notebook_fav_screen.dart';
import 'notice_board_fav_screen.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  final selectedIndexNotifier = ValueNotifier<int?>(0);
  int selectedPage = 0;

  List<Widget> pages = [
    allfavouriteScreen(),
    materialfavScreen(),
    noticeboardfavScreen(),
    notebookfavScreen(),
  ];

  List<String> names = ['All', 'Material', 'Notice Board', 'Note Book'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(103.h),
        child: ReuseableAppBar1(
          title: NormalText(
            text: 'Favourite',
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
          firstAppIcon: IconButton(
            onPressed: () {
              pushOnBoardingScreen(context);
            },
            icon:  Icon(Icons.arrow_back_ios,color: Colors.white, size: 30.w,),
          ),
          secondAppIcon: IconButton(
            onPressed: () {},
            icon:  Icon(Icons.search, color: Colors.white, size: 30.w,),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 24.0.w),
        child: Column(
          children: [
            ValueListenableBuilder<int?>(
              valueListenable: selectedIndexNotifier,
              builder: (_, selectedIndex, __) => Column(
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  SizedBox(
                    height: 60,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        for (int i = 0; i <= 3; i++)
                          CardButtons(
                              key: ValueKey(i),
                              cardButtonMessage: names[i],
                              selected: selectedIndex == i,
                              onPressed: () {
                                setState(() {
                                  selectedPage = i;
                                  selectedIndexNotifier.value = i;
                                });
                              }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 500.h,
              child: ListView(
                children: [pages[selectedPage]],
              ),
            )
          ],
        ),
      ),
    );
  }
}

// top buttons
class CardButtons extends StatefulWidget {
  final String cardButtonMessage;
  final VoidCallback onPressed;
  final bool selected;

  const CardButtons({
    Key? key,
    required this.cardButtonMessage,
    required this.selected,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<CardButtons> createState() => _CardButtonsState();
}

class _CardButtonsState extends State<CardButtons> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.0.h),
      child: InkWell(
        onTap: widget.onPressed,
        child: Container(
          decoration: BoxDecoration(
            color: widget.selected ? AppColor.mainColor : Colors.white,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.black12),
          ),
          width: 150.w,
          child: Center(
            child: NormalText(
              text: widget.cardButtonMessage,
              size: 16.sp,
              color: widget.selected ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
