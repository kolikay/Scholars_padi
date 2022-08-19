import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'material_fav_screen.dart';
import 'notebook_fav_screen.dart';
import 'notice_board_fav_screen.dart';

Widget allfavouriteScreen() {
  return SizedBox(
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(
        height: 15.h,
      ),
      materialfavScreen(),
      SizedBox(
        height: 15.h,
      ),
      noticeboardfavScreen(),
      SizedBox(
        height: 15.h,
      ),
      notebookfavScreen()
    ]),
  );
}
