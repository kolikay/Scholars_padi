import 'package:flutter/material.dart';
import 'package:scholars_padi/constants/appColor.dart';
import 'package:scholars_padi/routes/page_routes.dart';
import 'package:scholars_padi/widgets/reusesable_widget/reusable_app_bar1.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scholars_padi/widgets/reusesable_widget/normal_text.dart';
import 'package:scholars_padi/widgets/utils/progress_bar.dart';

class NoteBookScreen3 extends StatefulWidget {
  const NoteBookScreen3({
    Key? key,
  }) : super(key: key);

  @override
  State<NoteBookScreen3> createState() => _NoteBookScreen3State();
}

class _NoteBookScreen3State extends State<NoteBookScreen3> {
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(103.h),
            child: ReuseableAppBar1(
              title: NormalText(
                text: 'About Dubai',
                color: Colors.white,
              ),
              firstAppIcon: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios),
              ),
              secondAppIcon: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.edit),
              ),
              thirdAppIcon: IconButton(
                onPressed: () {
                  setState(() {
                    isVisible = !isVisible;
                  });
                },
                icon: const Icon(Icons.more_vert),
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(24.0),
            child: SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NormalText(
                    text: 'March 27, 2022 08:00pm',
                    color: AppColor.dullerBlack,
                    size: 12.sp,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  NormalText(
                    text: 'About Dubai',
                    size: 19.2,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  NormalText(
                    text:
                        """Dubai is the capital city of the Emirate of Dubai, one of the wealthiest of the seven emirates that constitute the federation of the United Arab Emirates, which was created in 1971 following independence from Great Britain. 

Dubai is a city of skyscrapers, ports, and  beaches, where big business takes place alongside sun-seeking tourism. Dubai is relatively crime-free place where administrative efficiency and openness to business have encouraged astounding growth.

Dubai’s population has grown steadily over the past two centuries, from just a few thousand local inhabitants to well over two million.

Dubai does not have an oil-based economy. Its electricity and water provisions have largely kept up with the city’s population growth.    
""",
                    color: Colors.black87,
                    size: 14.sp,
                  ),
                ],
              ),
            ),
          ),
        ),
        isVisible
            ? const Positioned(
                right: 0,
                top: 80,
                child: MoreDialog(),
              )
            : const SizedBox()
      ],
    );
  }
}

class MoreDialog extends StatelessWidget {
  const MoreDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        padding:const EdgeInsets.all(10),
        color: AppColor.darkContainer,
        height: 130.h,
        width: 180.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 20.w,
                ),
                Icon(
                  Icons.share,
                  color: AppColor.dullBlack,
                  size: 24.h,
                ),
                SizedBox(
                  width: 20.w,
                ),
                NormalText(
                  text: 'Share',
                  color: AppColor.dullBlack,
                )
              ],
            ),
            SizedBox(
              height: 20.w,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 20.w,
                ),
                Icon(
                  Icons.favorite,
                  color: AppColor.dullBlack,
                  size: 24.h,
                ),
                SizedBox(
                  width: 20.w,
                ),
                NormalText(
                  text: 'Favouriate',
                  color: AppColor.dullBlack,
                )
              ],
            ),
            SizedBox(
              height: 20.w,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 20.w,
                ),
                Icon(
                  Icons.delete,
                  color: AppColor.dullBlack,
                  size: 24.h,
                ),
                SizedBox(
                  width: 20.w,
                ),
                NormalText(
                  text: 'Delete',
                  color: AppColor.dullBlack,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
