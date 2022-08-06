import 'package:flutter/material.dart';
import 'package:scholars_padi/constants/appColor.dart';
import 'package:scholars_padi/constants/app_state_constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scholars_padi/widgets/reusesable_widget/normal_text.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



class MaterialCards extends ConsumerStatefulWidget {
  final String cardMessage;
  final String cardTitle;
  final String cardDate;
  final String cardTime;
  final Color? borderColor;
  final GestureTapCallback onTap;

  const MaterialCards(
      {Key? key,
      required this.cardMessage,
      required this.cardDate,
      required this.cardTime,
      required this.cardTitle,
      required this.onTap,
      this.borderColor})
      : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MaterialCardsState();
}

class _MaterialCardsState extends ConsumerState<MaterialCards> {
  // bool selected = false;

  @override
  Widget build(BuildContext context) {
    // Notitification Notifier for app bar
    final notificationViewModel = ref.watch(notificationProvider);
    return Container(
      width: 327.w,
      height: 145.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.53.w),
        border: notificationViewModel.selectedList.isEmpty
            ? Border.all(
                color: Colors.black12,
              )
            : Border.all(
                color: AppColor.mainColor,
                width: 2.0,
                style: BorderStyle.solid),
        color: const Color(0xffb580ff),
      ),
      child: Padding(
        padding: EdgeInsets.all(10.0.w),
        child: InkWell(
          onTap: widget.onTap,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 222.w,
                    height: 45.h,
                    child: NormalText(
                      text: widget.cardTitle,
                      size: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  NormalText(
                    text: widget.cardDate,
                    size: 12.sp,
                    color: AppColor.dullerBlack,
                  ),
                ],
              ),
              SizedBox(
                height: 58.h,
                width: 327.w,
                child: NormalText(
                  text: widget.cardMessage,
                  size: 12.sp,
                  color: AppColor.dullBlack,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 100.w,
                  ),
                  NormalText(
                    text: widget.cardTime,
                    size: 11.sp,
                    color: AppColor.dullerBlack,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
