import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scholars_padi/constants/appColor.dart';
import 'package:scholars_padi/screens/material/reuseable_material_screen_list.dart';
import 'package:scholars_padi/screens/on_boarding/home_screens/categories_search_screen.dart';

import 'package:scholars_padi/widgets/reusesable_widget/reuseable_appbar.dart';

import 'homepage_constant_widgets.dart';

class CategoriesPage extends ConsumerStatefulWidget {
  static const id = 'catsearchscreen';
  const CategoriesPage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends ConsumerState<CategoriesPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              color: AppColor.mainColor,
              height: 103.h,
              width: 375.w,
              child: ReuseableAppbar(
                color: Colors.white,
                appBarTitle: 'Categories',
                firstAppIcon: Icons.arrow_back_ios,
                secondAppIcon: Icons.search,
                firstButton: () {
                  Navigator.pop(context);
                },
                secondButton: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: ((context) => const CatergoriesSearchScreen()),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: Container(
                color: AppColor.darkContainer,
                child: GridView.count(
                    primary: false,
                    crossAxisSpacing: 1,
                    mainAxisSpacing: 1,
                    crossAxisCount: 3,
                    children: <Widget>[
                      HomeConstants.categoryCard(
                          context, 'Material', 'lib/assets/material.png', () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) =>
                                  ReuseableMaterialScreenList(
                                    appBarTitle: 'Other Material',
                                    message: 'Select Your Faculty',
                                    materialCard1: MaterialCards(cardMessage: 'Faculty of Science', onPressed: (){},),
                                    materialCard2: MaterialCards(cardMessage: 'Faculty of Science', onPressed: (){},),
                                    materialCard3: MaterialCards(cardMessage: 'Faculty of Science', onPressed: (){},),
                                    materialCard4: MaterialCards(cardMessage: 'Faculty of Science', onPressed: (){},),
                                    materialCard5: MaterialCards(cardMessage: 'Faculty of Science', onPressed: (){},),
                                    // materialCard4: const SizedBox(),
                                    // materialCard5:const  SizedBox(),
                              
                                  )),
                        );
                      }),
                      HomeConstants.categoryCard(context, 'Past Question',
                          'lib/assets/pastQuestion.png', () {}),
                      HomeConstants.categoryCard(context, 'Scheduler',
                          'lib/assets/schduler.png', () {}),
                      HomeConstants.categoryCard(context, 'Note Book',
                          'lib/assets/notebook.png', () {}),
                      HomeConstants.categoryCard(context, 'Scholarships',
                          'lib/assets/scholaship.png', () {}),
                      HomeConstants.categoryCard(context, 'Notice Boards',
                          'lib/assets/noticeBoard.png', () {}),
                      HomeConstants.categoryCard(
                          context, 'Chats', 'lib/assets/chat.png', () {}),
                      HomeConstants.categoryCard(context, 'School Portal',
                          'lib/assets/schoolPortal.png', () {}),
                      HomeConstants.categoryCard(context, 'School Calender',
                          'lib/assets/calender.png', () {}),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
