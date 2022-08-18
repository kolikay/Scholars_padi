import 'package:flutter/material.dart';
import 'package:scholars_padi/constants/appColor.dart';
import 'package:scholars_padi/widgets/reusesable_widget/reusable_app_bar1.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scholars_padi/widgets/reusesable_widget/normal_text.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:scholars_padi/widgets/utils/snack_bar.dart';

List<MaterialCards> card = List.of(allCards);

List<MaterialCards> allCards = const [
  MaterialCards(
    cardColor1: Colors.blue,
    cardDate: 'March 13, 2022  08:53AM',
    cardMessage: 'School Materials  testing',
    cardColor2: Color(0xffd1ecfa),
  ),
  MaterialCards(
    cardColor1: Colors.blue,
    cardDate: 'March 13, 2022  08:53AM',
    cardMessage: 'School Materials',
    cardColor2: Color(0xffd1ecfa),
  ),
  MaterialCards(
    cardColor1: Colors.blue,
    cardDate: 'March 13, 2022  08:53AM',
    cardMessage: 'School Materials',
    cardColor2: Color(0xffd1ecfa),
  ),
  MaterialCards(
    cardColor1: Colors.blue,
    cardDate: 'March 13, 2022  08:53AM',
    cardMessage: 'School Materials',
    cardColor2: Color(0xffd1ecfa),
  ),
  MaterialCards(
    cardColor1: Colors.blue,
    cardDate: 'March 13, 2022  08:53AM',
    cardMessage: 'School Materials',
    cardColor2: Color(0xffd1ecfa),
  ),
  MaterialCards(
    cardColor1: Colors.blue,
    cardDate: 'March 13, 2022  08:53AM',
    cardMessage: 'School Materials',
    cardColor2: Color(0xffd1ecfa),
  ),
  MaterialCards(
    cardColor1: Colors.blue,
    cardDate: 'March 13, 2022  08:53AM',
    cardMessage: 'School Materials',
    cardColor2: Color(0xffd1ecfa),
  ),
  MaterialCards(
    cardColor1: Colors.blue,
    cardDate: 'March 13, 2022  08:53AM',
    cardMessage: 'School Materials',
    cardColor2: Color(0xffd1ecfa),
  ),
];

class NoteBookScreen1 extends StatefulWidget {
  const NoteBookScreen1({
    Key? key,
  }) : super(key: key);

  @override
  State<NoteBookScreen1> createState() => _NoteBookScreen1State();
}

class _NoteBookScreen1State extends State<NoteBookScreen1> {
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(103.h),
        child: ReuseableAppBar1(
          title: NormalText(
            text: 'NoteBook',
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
            icon: const Icon(Icons.search),
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: 812.h,
        color: AppColor.darkContainer,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Center(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // SizedBox(
                //   height: 120.h,
                //   width: 120.h,
                //   child: Icon(
                //     Icons.note_alt_outlined,
                //     size: 120.h,
                //     color: AppColor.dullerBlack,
                //   ),
                // ),
                // SizedBox(
                //   height: 20.h,
                // ),
                // NormalText(
                //   text: 'Make your life organized by recording daily notes',
                //   size: 16.sp,
                //   color: AppColor.dullerBlack,
                // ),
                SizedBox(
                  height: 15.h,
                ),
                Expanded(
                  child: SizedBox(
                    child: ListView.separated(
                        separatorBuilder: (BuildContext context, int index) =>
                            SizedBox(
                              height: 10.h,
                            ),
                        itemCount: card.length,
                        itemBuilder: (context, index) {
                          final materialCard = card[index];
                          return Slidable(
                            actionExtentRatio: 0.25,
                            actionPane: const SlidableDrawerActionPane(),
                            secondaryActions: <Widget>[
                              IconSlideAction(
                                caption: 'Delete',
                                color: Colors.red,
                                icon: Icons.delete,
                                onTap: () {
                                  onDismissed(index);
                                },
                              )
                            ],
                            child: MaterialCards(
                                cardMessage: materialCard.cardMessage,
                                cardDate: materialCard.cardDate,
                                cardColor1: materialCard.cardColor1,
                                cardColor2: materialCard.cardColor2),
                          );
                        }),
                  ),
                ),
                SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      !isVisible
                          ? const SizedBox(
                              height: 60,
                            )
                          : Visibility(
                              visible: isVisible,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        height: 32.h,
                                        width: 56.h,
                                        color: Colors.black87,
                                        child: Center(child: NormalText(text: 'Note', color: Colors.white))
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: AppColor.mainColor,
                                          ),
                                          height: 36.h,
                                          width: 36.w,
                                          child: const Icon(
                                            Icons.note_add,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                ],
                              ),
                            ),
                      !isVisible
                          ? const SizedBox(
                              height: 60,
                            )
                          : Visibility(
                              visible: isVisible,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        height: 32.h,
                                        width: 76.h,
                                        color: Colors.black87,
                                        child: Center(child: NormalText(text: 'Checklist', color: Colors.white))
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: AppColor.mainColor,
                                          ),
                                          height: 36.h,
                                          width: 36.w,
                                          child: const Icon(
                                            Icons.checklist_outlined,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                ],
                              ),
                            ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            isVisible = !isVisible;
                          });
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColor.mainColor,
                          ),
                          height: 50.h,
                          width: 50.w,
                          child: Icon(
                            !isVisible ? Icons.add : Icons.close,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onDismissed(int index) {
    setState(() {
      card.removeAt(index);
      ShowSnackBar.openSnackBar(context, 'Item Deleted', 'Undo', () {});
    });
  }
}

class MaterialCards extends StatefulWidget {
  const MaterialCards({
    Key? key,
    required this.cardMessage,
    required this.cardDate,
    required this.cardColor1,
    required this.cardColor2,
  }) : super(key: key);

  final String cardMessage;
  final String cardDate;
  final Color cardColor1;
  final Color cardColor2;

  @override
  State<MaterialCards> createState() => _MaterialCardsState();
}

class _MaterialCardsState extends State<MaterialCards> {
  bool tapped = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 327.w,
      height: 80.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.black12)),
      child: Row(
        children: [
          Container(
            width: 5,
            color: widget.cardColor1,
          ),
          Expanded(
            child: Container(
              color: widget.cardColor2,
              child: Padding(
                padding: EdgeInsets.only(left: 10.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        NormalText(
                          text: widget.cardMessage,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          size: 16.sp,
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              tapped = !tapped;
                            });
                          },
                          icon: Icon(
                            !tapped ? Icons.favorite_border : Icons.favorite,
                            color: AppColor.mainColor,
                            size: 20.sp,
                          ),
                        )
                      ],
                    ),
                    NormalText(
                      text: widget.cardDate,
                      color: AppColor.dullBlack,
                      size: 12.sp,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
