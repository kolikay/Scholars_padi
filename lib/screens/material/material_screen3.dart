import 'package:flutter/material.dart';
import 'package:scholars_padi/screens/material/material_screen4.dart';
import 'package:scholars_padi/widgets/reusesable_widget/reusable_app_bar1.dart';
import 'package:scholars_padi/widgets/reusesable_widget/normal_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MaterialScreen3 extends StatelessWidget {
   final String title;
  const MaterialScreen3({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(103.h),
        child: ReuseableAppBar1(
          title: NormalText(
            text: title,
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
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 24.h,
              ),
              NormalText(
                text: 'Select Your Department',
                fontWeight: FontWeight.bold,
                size: 16.sp,
                color: Colors.black54,
              ),
              SizedBox(
                height: 16.h,
              ),
              const MaterialCards(
                cardMessage: 'Department of Chemistry',
              ),
              SizedBox(
                height: 16.h,
              ),
              const MaterialCards(
                cardMessage: 'Department of Physics',
              ),
              SizedBox(
                height: 16.h,
              ),
              const MaterialCards(
                cardMessage: 'Department of Botany',
              ),
              SizedBox(
                height: 16.h,
              ),
              const MaterialCards(
                cardMessage: 'Department of Mathematics',
              ),
              SizedBox(
                height: 16.h,
              ),
              const MaterialCards(
                cardMessage: 'Department of Geology',
              ),
            ]),
      ),
    ));
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
            builder: ((context) =>  MaterialScreen4(title: cardMessage,)),
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
