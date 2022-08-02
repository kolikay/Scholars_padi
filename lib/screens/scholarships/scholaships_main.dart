import 'package:flutter/material.dart';
import 'package:scholars_padi/constants/appColor.dart';
import 'package:scholars_padi/screens/material/material_screen7.dart';
import 'package:scholars_padi/screens/scholarships/scholarship_screen2.dart';
import 'package:scholars_padi/screens/scholarships/scholarship_screen3.dart';
import 'package:scholars_padi/screens/scholarships/scholarship_screen4.dart';
import 'package:scholars_padi/screens/scholarships/scholaship_screen1.dart';
import 'package:scholars_padi/widgets/reusesable_widget/reusable_app_bar1.dart';
import 'package:scholars_padi/widgets/reusesable_widget/normal_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

class ScholarshipScreen1 extends StatefulWidget {
  const ScholarshipScreen1({
    Key? key,
  }) : super(key: key);

  @override
  State<ScholarshipScreen1> createState() => _ScholarshipScreen1State();
}

class _ScholarshipScreen1State extends State<ScholarshipScreen1> {
  final selectedIndexNotifier = ValueNotifier<int?>(0);
  int selectedPage = 0;

  List<Widget> pages = [
    scholarshipScreen1(),
    scholarshipScreen2(),
    scholarshipScreen3(),
    scholarshipScreen4(),
  ];

  List<String> names = ['All', 'Categories', 'Countires', 'Levels'];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(103.h),
          child: ReuseableAppBar1(
            title: NormalText(
              text: 'Scholarship',
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
            firstAppIcon: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios),
            ),
            secondAppIcon: IconButton(
              onPressed: () {
                print(selectedPage);
              },
              icon: const Icon(Icons.search),
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
                                    selectedIndex == i
                                        ? selectedIndexNotifier.value = null
                                        : selectedIndexNotifier.value = i;
                                  });
                                }),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              pages[selectedPage]
            ],
          ),
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
