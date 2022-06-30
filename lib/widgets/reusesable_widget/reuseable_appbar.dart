import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReuseableAppbar extends StatefulWidget {
  final GestureTapCallback menuPressed;
  final GestureTapCallback searchPressed;
  const ReuseableAppbar(
      {Key? key, required this.menuPressed, required this.searchPressed})
      : super(key: key);

  @override
  State<ReuseableAppbar> createState() => _ReuseableAppbarState();
}

class _ReuseableAppbarState extends State<ReuseableAppbar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: widget.menuPressed,
            child: Icon(Icons.menu, size: 30.0.w),
          ),
          GestureDetector(
            onTap: widget.searchPressed,
            child:  Icon(Icons.search, size: 30.0.w),
          ),
        ],
      ),
    );
  }
}
