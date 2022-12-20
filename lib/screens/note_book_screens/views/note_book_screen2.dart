import 'package:flutter/material.dart';
import 'package:scholars_padi/constants/appColor.dart';
import 'package:scholars_padi/constants/app_state_constants.dart';
import 'package:scholars_padi/widgets/reusesable_widget/reusable_app_bar1.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scholars_padi/widgets/reusesable_widget/normal_text.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scholars_padi/widgets/utils/progress_bar.dart';

class NoteBookScreen2 extends ConsumerStatefulWidget {
  const NoteBookScreen2({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<NoteBookScreen2> createState() => _NoteBookScreen2State();
}

class _NoteBookScreen2State extends ConsumerState<NoteBookScreen2> {
  final titileController = TextEditingController();
  final contentController = TextEditingController();
  bool isFavourite = false;
  @override
  Widget build(BuildContext context) {
    final noteViewModel = ref.watch(noteViewModelProvider);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(103.h),
        child: ReuseableAppBar1(
          title: NormalText(
            text: 'New Notes',
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
              noteViewModel.saveNotes({
                "title": titileController.text,
                "content": contentController.text,
                "is_favourite": isFavourite,
              }, context);
            },
            icon: const Icon(Icons.save),
          ),
          thirdAppIcon: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NormalText(
                    text: DateTime.now().toString(),
                    color: AppColor.dullerBlack,
                    size: 12.sp,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  TextField(
                    controller: titileController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'Title',
                      helperStyle: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColor.dullBlack),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  SizedBox(
                    height: 300.h,
                    width: double.infinity,
                    child: TextFormField(
                      maxLines: null,
                      expands: true,
                      controller: contentController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'wrtie notes',
                        helperStyle: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColor.dullBlack),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            child: noteViewModel.loading
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
}
