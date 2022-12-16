// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:scholars_padi/constants/appColor.dart';
import 'package:scholars_padi/constants/app_state_constants.dart';
import 'package:scholars_padi/routes/page_routes.dart';
import 'package:scholars_padi/screens/note_book_screens/note_book_view_model/note_book_view_model.dart';
import 'package:scholars_padi/widgets/reusesable_widget/reusable_app_bar1.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scholars_padi/widgets/reusesable_widget/normal_text.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:scholars_padi/widgets/utils/progress_bar.dart';
import 'package:scholars_padi/widgets/utils/snack_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NoteBookScreen1 extends ConsumerStatefulWidget {
  const NoteBookScreen1({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<NoteBookScreen1> createState() => _NoteBookScreen1State();
}

class _NoteBookScreen1State extends ConsumerState<NoteBookScreen1> {
  bool isVisible = false;
  final searchController = TextEditingController();

  @override
  void initState() {
    NoteViewModel.instance.getSavedNotes(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //user data update notifire
    final notes = ref.watch(noteViewModelProvider);

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
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 812.h,
            color: AppColor.darkContainer,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 15.h,
                    ),
                    Expanded(
                      child: SizedBox(
                        child: ListView.separated(
                            separatorBuilder:
                                (BuildContext context, int index) => SizedBox(
                                      height: 10.h,
                                    ),
                            itemCount: notes.noteFromServer.length,
                            itemBuilder: (context, index) {
                              // final materialCard = card[index];
                              return Slidable(
                                actionExtentRatio: 0.25,
                                actionPane: const SlidableDrawerActionPane(),
                                secondaryActions: <Widget>[
                                  IconSlideAction(
                                    caption: 'Delete',
                                    color: Colors.red,
                                    icon: Icons.delete,
                                    onTap: () {
                                      notes.setLoading(true);
                                      onDismissed(ref,
                                          notes.noteFromServer[index].title);
                                    },
                                  )
                                ],
                                child: MaterialCards(
                                  ontap: () {
                                    notes.getSingleNotes(
                                        context,
                                        notes.noteFromServer[index].title ??
                                            '');
                                    pushNoteBookScreen3(context);
                                  },
                                  cardMessage:
                                      notes.noteFromServer[index].title!,
                                  cardDate: DateTime.now().toString(),
                                ),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Container(
                                              height: 32.h,
                                              width: 56.h,
                                              color: Colors.black87,
                                              child: Center(
                                                  child: NormalText(
                                                      text: 'Note',
                                                      color: Colors.white))),
                                          const SizedBox(
                                            width: 15,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              pushNoteBookScreen2(context);
                                            },
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Container(
                                              height: 32.h,
                                              width: 76.h,
                                              color: Colors.black87,
                                              child: Center(
                                                  child: NormalText(
                                                      text: 'Checklist',
                                                      color: Colors.white))),
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
          Positioned(
            child: notes.loading
                ? const Center(
                    child: ProgressDialog(
                      message: 'Loading....',
                    ),
                  )
                : const SizedBox(),
          ),
        ],
      ),
    );
  }

  void onDismissed(WidgetRef ref, String noteTitle) {
    final notes = ref.watch(noteViewModelProvider);
    notes.deleteNote(context, noteTitle);
  }
}

class MaterialCards extends StatefulWidget {
  const MaterialCards(
      {Key? key, required this.cardMessage, required this.cardDate, this.ontap})
      : super(key: key);

  final String cardMessage;
  final String cardDate;

  final GestureTapCallback? ontap;

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
            color: Colors.blue,
          ),
          Expanded(
            child: InkWell(
              onTap: widget.ontap,
              child: Container(
                color: Color(0xffd1ecfa),
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
            ),
          )
        ],
      ),
    );
  }
}
