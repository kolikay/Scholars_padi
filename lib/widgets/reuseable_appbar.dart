import 'package:flutter/material.dart';

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
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: widget.menuPressed,
            child: const Icon(Icons.menu, size: 30.0),
          ),
          GestureDetector(
            onTap: widget.searchPressed,
            child: const Icon(Icons.search, size: 30.0),
          ),
        ],
      ),
    );
  }
}
