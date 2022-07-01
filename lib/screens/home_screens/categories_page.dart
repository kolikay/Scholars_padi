import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scholars_padi/constants/appColor.dart';
import 'package:scholars_padi/screens/home_screens/homepage_constant_widgets.dart';
import 'package:scholars_padi/widgets/reusesable_widget/normal_text.dart';
import 'package:scholars_padi/widgets/reusesable_widget/reuseable_appbar.dart';

class CategoriesPage extends ConsumerStatefulWidget {
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
                menuPressed: () {},
                searchPressed: () {},
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
                          context, 'home', 'lib/assets/home1.png'),
                      HomeConstants.categoryCard(
                          context, 'home', 'lib/assets/home1.png'),
                      HomeConstants.categoryCard(
                          context, 'home', 'lib/assets/home1.png'),
                      HomeConstants.categoryCard(
                          context, 'home', 'lib/assets/home1.png'),
                      HomeConstants.categoryCard(
                          context, 'home', 'lib/assets/home1.png'),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
