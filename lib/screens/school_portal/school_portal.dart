import 'package:flutter/material.dart';
import 'package:scholars_padi/constants/appColor.dart';
import 'package:scholars_padi/widgets/reusesable_widget/reusable_app_bar1.dart';
import 'package:scholars_padi/widgets/reusesable_widget/normal_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scholars_padi/widgets/reusesable_widget/reuseable_button.dart';

class SchoolPortal extends StatefulWidget {
  const SchoolPortal({
    Key? key,
  }) : super(key: key);

  @override
  State<SchoolPortal> createState() => _SchoolPortalState();
}

class _SchoolPortalState extends State<SchoolPortal> {
  final selectedIndexNotifier = ValueNotifier<int?>(0);
  int selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(103.h),
          child: ReuseableAppBar1(
            title: NormalText(
              text: 'School Portal',
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
        body: Padding(
          padding: EdgeInsets.only(left: 24.0.w),
          child: Column(
            children: [
              SizedBox(height: 24.h),
              InkWell(
                onTap: () {
                  bottomSheet(context);
                },
                child: Container(
                  width: 250.w,
                  height: 250.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.53.w),
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('lib/assets/educationLogo.JPG'),
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 15.h,
                  ),
                  NormalText(
                    text: 'You can assess the OAU eportal using the link below:',
                    fontWeight: FontWeight.bold,
                    size: 16.sp,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  NormalText(
                    text: 'www.eportal.oauife.edu.ng/login.php',
                    size: 16.sp,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  bottomSheet(BuildContext context) async {
    return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (builder) {
        return Container(
          decoration: const BoxDecoration(
            color: AppColor.darkContainer,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          height: 364.h,
          child: Column(
            children: [
              SizedBox(
                height: 30.h,
              ),
              NormalText(
                text: 'Obafemi Awolowo University',
                fontWeight: FontWeight.bold,
                size: 19.sp,
                color: AppColor.mainColor,
              ),
              SizedBox(
                height: 10.h,
              ),
              NormalText(
                text: 'Year of Establishment',
                fontWeight: FontWeight.w500,
                size: 16.sp,
              ),
              SizedBox(
                height: 10.h,
              ),
              NormalText(
                text: 'October 1972',
                fontWeight: FontWeight.w500,
                size: 16.sp,
                color: AppColor.dullerBlack,
              ),
              SizedBox(
                height: 10.h,
              ),
              NormalText(
                text: 'Location',
                fontWeight: FontWeight.bold,
                size: 16.sp,
              ),
              SizedBox(
                height: 10.h,
              ),
              NormalText(
                text: 'Ile-Ife, Osun State, Nigeria.',
                fontWeight: FontWeight.bold,
                size: 16.sp,
                color: AppColor.dullerBlack,
              ),
              SizedBox(
                height: 10.h,
              ),
              NormalText(
                text: 'www.eportal.oauife.edu.ng/login.php',
                fontWeight: FontWeight.bold,
                size: 16.sp,
                color: AppColor.dullerBlack,
              ),
              SizedBox(
                height: 24.h,
              ),
              ReuseableButton(
                text: 'Copy Link',
                onPressed: () {},
                textSize: 18.sp,
              ),
              SizedBox(
                height: 10.h,
              ),
              ReuseableButton(
                text: 'Preview Now',
                onPressed: () {},
                backGroundColor: Colors.white,
                textColor: AppColor.mainColor,
                textSize: 18.sp,
              ),
            ],
          ),
        );
      },
    );
  }
}
