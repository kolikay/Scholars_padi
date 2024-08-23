import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scholars_padi/constants/appColor.dart';
import 'package:scholars_padi/constants/app_state_constants.dart';
import 'package:scholars_padi/routes/page_routes.dart';
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
    final notes = ref.watch(noteViewModelProvider);
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
                  pushCatergoriesSearchScreen(context);
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
                          context, 'Material', 'assets/images/material.png',
                          () {
                        pushMaterialScreen(context);
                      }),
                      HomeConstants.categoryCard(context, 'Past Question',
                          'assets/images/pastQuestion.png', () {}),
                      HomeConstants.categoryCard(context, 'Scheduler',
                          'assets/images/schduler.png', () {}),
                      HomeConstants.categoryCard(
                          context, 'Note Book', 'assets/images/notebook.png',
                          () {
                        //get saved note from server and display on note screen 1
                        notes.getSavedNotes(context);
                        pushNoteBookScreen1(context);
                      }),
                      HomeConstants.categoryCard(context, 'Scholarships',
                          'assets/images/scholaship.png', () {
                        pushScholarshipScreen(context);
                      }),
                      HomeConstants.categoryCard(context, 'Notice Boards',
                          'assets/images/noticeBoard.png', () {
                        pushNoticeScreen(context);
                      }),
                      HomeConstants.categoryCard(
                          context, 'Chats', 'assets/images/chat.png', () {}),
                      HomeConstants.categoryCard(context, 'School Portal',
                          'assets/images/schoolPortal.png', () {
                        pushSchoolPortalScreen(context);
                      }),
                      HomeConstants.categoryCard(context, 'School Calender',
                          'assets/images/calender.png', () {}),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
