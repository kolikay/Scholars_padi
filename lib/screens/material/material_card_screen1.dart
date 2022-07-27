import 'package:flutter/material.dart';
import 'package:scholars_padi/constants/appColor.dart';
import 'package:scholars_padi/routes/page_routes.dart';
import 'package:scholars_padi/screens/material/material_card_screen2.dart';
import 'package:scholars_padi/screens/material/material_card_screen3.dart';
import 'package:scholars_padi/screens/material/reuseable_material_screen_list.dart';
import 'package:scholars_padi/widgets/reusesable_widget/reusable_app_bar1.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scholars_padi/widgets/reusesable_widget/normal_text.dart';

class MaterialCardScreen1 extends StatelessWidget {
  const MaterialCardScreen1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(103.h),
        child: ReuseableAppBar1(
          title: NormalText(
            text: 'Materials',
            color: Colors.white,
          ),
          firstAppIcon: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          secondAppIcon: IconButton(
            onPressed: () {
              pushCatergoriesSearchScreen(context);
            },
            icon: const Icon(Icons.search),
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        color: AppColor.darkContainer,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              SizedBox(
                height: 15.h,
              ),
              NormalText(
                text: 'Select a semester to see the available courses',
                fontWeight: FontWeight.bold,
                size: 16,
              ),
              SizedBox(
                height: 25.h,
              ),
              InkWell(
                onTap: () {
                  // display select faculty page first card
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ReuseableMaterialScreenList(
                        appBarTitle: 'Other Material',
                        message: 'Select Your Faculty',
                        materialCard1: MaterialCards(
                          cardMessage: 'Faculty of Science',
                          onPressed: () {
                            // display select department page on first card
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    ReuseableMaterialScreenList(
                                  appBarTitle: 'Faculty of Science',
                                  message: 'Select Your Department',
                                  materialCard1: MaterialCards(
                                    onPressed: () {
                                      // display select your level page first card
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) =>
                                            ReuseableMaterialScreenList(
                                          appBarTitle:
                                              'Department of Chemistry',
                                          message: 'Select Your Level',
                                          materialCard1: MaterialCards(
                                            onPressed: () {
                                              //display select your semester on first card

                                              Navigator.of(context).push(
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      MaterialCardScreen2(
                                                    onPressed1: () {
                                                      Navigator.of(context)
                                                          .push(
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              ReuseableMaterialScreenList(
                                                            appBarTitle:
                                                                'Harmatthan Semester',
                                                            message:
                                                                'Select a course list for harmattan semester to see the aailable materials',
                                                            materialCard1:
                                                                MaterialCards(
                                                              onPressed: () {
                                                                Navigator.of(
                                                                        context)
                                                                    .push(
                                                                  MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            MaterialCardScreen3(
                                                                      onPressed1:
                                                                          () {},
                                                                      onPressed2:
                                                                          () {},
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                              cardMessage:
                                                                  'CHM 101',
                                                            ),
                                                            materialCard2:
                                                                MaterialCards(
                                                              onPressed: () {},
                                                              cardMessage:
                                                                  'CHM 103',
                                                            ),
                                                            materialCard3:
                                                                MaterialCards(
                                                              onPressed: () {},
                                                              cardMessage:
                                                                  'PHY 103',
                                                            ),
                                                            materialCard4:
                                                                MaterialCards(
                                                              onPressed: () {},
                                                              cardMessage:
                                                                  'PHY 107',
                                                            ),
                                                            materialCard5:
                                                                MaterialCards(
                                                              onPressed: () {},
                                                              cardMessage:
                                                                  'MTH 104',
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                    onPressed2: () {},
                                                  ),
                                                ),
                                              );
                                            },
                                            cardMessage: 'Part 1',
                                          ),
                                          materialCard2: MaterialCards(
                                            onPressed: () {},
                                            cardMessage: 'Part 2',
                                          ),
                                          materialCard3: MaterialCards(
                                            onPressed: () {},
                                            cardMessage: 'Part 3',
                                          ),
                                          materialCard4: MaterialCards(
                                            onPressed: () {},
                                            cardMessage: 'Part 4',
                                          ),
                                        ),
                                      ));
                                    },
                                    cardMessage: 'Department of Chemistry',
                                  ),
                                  materialCard2: MaterialCards(
                                    onPressed: () {},
                                    cardMessage: 'Department of Physics',
                                  ),
                                  materialCard3: MaterialCards(
                                    onPressed: () {},
                                    cardMessage: 'Department of Botany',
                                  ),
                                  materialCard4: MaterialCards(
                                    onPressed: () {},
                                    cardMessage: 'Department of Mathematics',
                                  ),
                                  materialCard5: MaterialCards(
                                    onPressed: () {},
                                    cardMessage: 'Department of Geology',
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        materialCard2: MaterialCards(
                          cardMessage: 'Faculty of Pharmacy',
                          onPressed: () {},
                        ),
                        materialCard3: MaterialCards(
                          cardMessage: 'Faculty of Agriculture',
                          onPressed: () {},
                        ),
                        materialCard4: MaterialCards(
                          cardMessage: 'Faculty of Social Science',
                          onPressed: () {},
                        ),
                        materialCard5: MaterialCards(
                          cardMessage: 'Faculty of Engineering',
                          onPressed: () {},
                        ),
                        // materialCard4: const SizedBox(),
                        // materialCard5:const  SizedBox(),
                      ),
                    ),
                  );
                },
                child: Stack(
                  children: [
                    Container(
                      width: 327.w,
                      height: 178.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.53.w),
                        image: const DecorationImage(
                          fit: BoxFit.contain,
                          image: AssetImage('lib/assets/matImage1.png'),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 70,
                      left: 50,
                      child: NormalText(
                        text: 'Class Materials',
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        size: 30.sp,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 32.h,
              ),
              InkWell(
                onTap: () {},
                child: Stack(
                  children: [
                    Container(
                      width: 327.w,
                      height: 178.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.53.w),
                        image: const DecorationImage(
                          fit: BoxFit.contain,
                          image: AssetImage('lib/assets/matImage2.png'),
                        ),
                      ),
                    ),
                    Positioned(
                        top: 70,
                        left: 50,
                        child: NormalText(
                          text: 'Other Materials',
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          size: 30.sp,
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
