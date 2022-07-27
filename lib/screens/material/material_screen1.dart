import 'package:flutter/material.dart';
import 'package:scholars_padi/constants/appColor.dart';
import 'package:scholars_padi/routes/page_routes.dart';
import 'package:scholars_padi/screens/material/material_screen2.dart';
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
                height: 25.h,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: ((context) => const MaterialScreen2(title: 'Class Materials',)),
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
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: ((context) => const MaterialScreen2(title: 'Other Materials',)),
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
