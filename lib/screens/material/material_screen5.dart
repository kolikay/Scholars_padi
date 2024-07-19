import 'package:flutter/material.dart';
import 'package:scholars_padi/constants/appColor.dart';
import 'package:scholars_padi/routes/page_routes.dart';
import 'package:scholars_padi/screens/material/material_screen6.dart';
import 'package:scholars_padi/widgets/reusesable_widget/reusable_app_bar1.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scholars_padi/widgets/reusesable_widget/normal_text.dart';

class MaterialScreen5 extends StatelessWidget {
  final String title;
  const MaterialScreen5({
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(103.h),
        child: ReuseableAppBar1(
          title: NormalText(
            text: title,
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
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: ((context) => const MaterialScreen6(
                            title: 'Harmattan Semester',
                          )),
                    ),
                  );
                },
                child: Container(
                  width: 327.w,
                  height: 178.h,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(5.53.w),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      NormalText(
                        text: 'Harmattan Semester',
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        size: 23,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      NormalText(
                        text: 'Courses',
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        size: 23,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 32.h,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: ((context) => const MaterialScreen6(
                            title: 'Rain Semester',
                          )),
                    ),
                  );
                },
                child: Container(
                  width: 327.w,
                  height: 178.h,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(5.53.w),
                  ),
                  child: Center(
                    child: NormalText(
                      text: 'Rain Semester Courses',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      size: 23,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
