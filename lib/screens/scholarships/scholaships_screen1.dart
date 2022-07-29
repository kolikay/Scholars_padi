import 'package:flutter/material.dart';
import 'package:scholars_padi/constants/appColor.dart';
import 'package:scholars_padi/constants/app_state_constants.dart';
import 'package:scholars_padi/screens/material/material_screen7.dart';
import 'package:scholars_padi/widgets/reusesable_widget/reusable_app_bar1.dart';
import 'package:scholars_padi/widgets/reusesable_widget/normal_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

class ScholarshipScreen1 extends StatefulWidget {
  const ScholarshipScreen1({
    Key? key,
  }) : super(key: key);

  @override
  State<ScholarshipScreen1> createState() => _ScholarshipScreen1State();
}

class _ScholarshipScreen1State extends State<ScholarshipScreen1> {
  final selectedIndexNotifier = ValueNotifier<int?>(null);
  int activeImageIndex = 0;
  List<String> names =  ['All', 'Categories', 'Countires', 'Reviews'];
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
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            ValueListenableBuilder<int?>(
              valueListenable: selectedIndexNotifier,
              builder: (_, selectedIndex, __) => Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 60,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        for (int i = 0; i <= 4; i++)
                        // for(int x in names as List)
                          CardButtons(
                              key: ValueKey(i),
                              cardButtonMessage: names[i],
                              isFavorite: selectedIndex == i,
                              onPressed: () => selectedIndex == i
                                  ? selectedIndexNotifier.value = null
                                  : selectedIndexNotifier.value = i),
                      ],
                    ),
                  )
                ],
              ),
            ),

            // ListView(
            //   scrollDirection: Axis.horizontal,
            //   children: [
            //     CardButtons(
            //       cardButtonMessage: 'All',
            //       onPressed: () {
            //         setState(() {

            //         });
            //       },
            //       buttonColor: Colors.white,
            //       buttonColortext: Colors.black,
            //     ),
            //     CardButtons(
            //       cardButtonMessage: 'Categories',
            //         onPressed: () {
            //         setState(() {

            //         });
            //       },
            //       buttonColor:  Colors.white,
            //       buttonColortext: Colors.black,
            //     ),
            //     CardButtons(
            //       cardButtonMessage: 'Counties',
            //        onPressed: () {
            //         setState(() {

            //         });
            //       },
            //       buttonColor:  Colors.white,
            //       buttonColortext: Colors.black,
            //     ),
            //     CardButtons(
            //       cardButtonMessage: 'Levels',
            //       onPressed: () {},
            //       buttonColor: Colors.green,
            //       buttonColortext: Colors.black,
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}

class CardButtons extends StatefulWidget {
  final String cardButtonMessage;
  final VoidCallback onPressed;
  final bool isFavorite;

  CardButtons({
    Key? key,
    required this.cardButtonMessage,
    required this.isFavorite,
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
            color: widget.isFavorite ? Colors.red : Colors.green,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.black12),
          ),
          width: 150.w,
          child: Center(
            child: NormalText(
              text: widget.cardButtonMessage,
              fontWeight: FontWeight.w500,
              size: 16.sp,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}

class MaterialCards extends StatelessWidget {
  const MaterialCards({
    Key? key,
    required this.cardMessage,
  }) : super(key: key);

  final String cardMessage;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: ((context) => MaterialScreen7(
                  title: cardMessage,
                )),
          ),
        );
      },
      child: Container(
        height: 50.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.black12)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
              child: NormalText(
                text: cardMessage,
                fontWeight: FontWeight.w500,
                size: 16.sp,
                color: Colors.black54,
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.black54,
            ),
          ],
        ),
      ),
    );
  }
}
