import 'package:flutter/material.dart';
import 'package:scholars_padi/constants/appColor.dart';
import 'package:scholars_padi/constants/app_state_constants.dart';
import 'package:scholars_padi/routes/page_routes.dart';
import 'package:scholars_padi/widgets/reusesable_widget/reusable_app_bar1.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scholars_padi/widgets/reusesable_widget/normal_text.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scholars_padi/widgets/utils/progress_bar.dart';

class NoteBookScreen3 extends ConsumerStatefulWidget {
  const NoteBookScreen3({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<NoteBookScreen3> createState() => _NoteBookScreen3State();
}

class _NoteBookScreen3State extends ConsumerState<NoteBookScreen3> {
  bool isVisible = false;
  bool onEdit = true;
  final contentController = TextEditingController();

  // @override
  // void initState() {
  //   NoteViewModel.instance.getSingleNotes(context, '');
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final notes = ref.watch(noteViewModelProvider);

    contentController.text = notes.oneNoteFromServer.content ?? '';

    return Stack(
      children: [
        Stack(
          children: [
            Scaffold(
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(103.h),
                child: InkWell(
                  onTap: () {
                    if (isVisible == true) {
                      setState(() {
                        isVisible = false;
                      });
                    }
                  },
                  child: ReuseableAppBar1(
                    title: NormalText(
                      text: notes.oneNoteFromServer.title ?? '',
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
                        setState(() {
                          onEdit = !onEdit;
                        });

                        // notes.setLoading(true);
                        // // print(notes.noteFromServer[0].title);
                        // notes.editNote(context, notes.noteFromServer[0].title);
                      },
                      icon: onEdit
                          ? const Icon(Icons.edit)
                          : const Icon(Icons.save),
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
              ),
              body: InkWell(
                onTap: () {
                  if (isVisible == true) {
                    setState(() {
                      isVisible = false;
                    });
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: SizedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        NormalText(
                          text: notes.oneNoteFromServer.createdAt ?? '',
                          color: AppColor.dullerBlack,
                          size: 12.sp,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        NormalText(
                          text: notes.oneNoteFromServer.title ?? '',
                          size: 19.2,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        TextFormField(
                          readOnly: onEdit,
                          controller: contentController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            isVisible
                ? const Positioned(
                    right: 0,
                    top: 110,
                    child: MoreDialog(),
                  )
                : const SizedBox()
          ],
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
    );
  }
}

class MoreDialog extends StatefulWidget {
  const MoreDialog({
    Key? key,
  }) : super(key: key);

  @override
  State<MoreDialog> createState() => _MoreDialogState();
}

class _MoreDialogState extends State<MoreDialog> {
  bool isFavourite = false;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: AppColor.darkContainer,
        height: 160.h,
        width: 190.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 10.w,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.share,
                    color: AppColor.dullBlack,
                    size: 26.h,
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                NormalText(
                  text: 'Share',
                  color: AppColor.dullBlack,
                )
              ],
            ),
            // SizedBox(
            //   height: 10.w,
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 10.w,
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      isFavourite = !isFavourite;
                    });
                  },
                  icon: Icon(
                    isFavourite ? Icons.favorite : Icons.favorite_outline_sharp,
                    color: AppColor.dullBlack,
                    size: 26.h,
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                NormalText(
                  text: isFavourite ? 'Favourite' : 'Unfavourite',
                  color: AppColor.dullBlack,
                )
              ],
            ),
            // SizedBox(
            //   height: 10.w,
            // ),
            InkWell(
              onTap: () {
                pushDeleteNote(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 10.w,
                  ),
                  IconButton(
                    onPressed: () {
                      pushDeleteNote(context);
                    },
                    icon: Icon(
                      Icons.delete,
                      color: AppColor.dullBlack,
                      size: 26.h,
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  NormalText(
                    text: 'Delete',
                    color: AppColor.dullBlack,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DeleteNoteScreen extends StatefulWidget {
  const DeleteNoteScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<DeleteNoteScreen> createState() => _DeleteNoteScreenState();
}

class _DeleteNoteScreenState extends State<DeleteNoteScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Dialog(
        child: SizedBox(
          height: 155.h,
          width: 237.w,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10.h,
                ),
                NormalText(
                  text: 'Delete',
                  fontWeight: FontWeight.bold,
                  size: 23.sp,
                ),
                SizedBox(
                  height: 10.h,
                ),
                NormalText(
                  text: 'Are you sure you want to delete this note?',
                  color: AppColor.dullBlack,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: NormalText(
                        text: 'Cancel',
                        size: 14,
                        color: AppColor.mainColor,
                      ),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: NormalText(
                        text: 'Delete',
                        size: 14,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
