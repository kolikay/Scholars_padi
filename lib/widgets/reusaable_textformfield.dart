// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:scholars_padi/constants/appColor.dart';

class MyTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final IconData? prefixIcon;
  final IconButton? sufixIcon;
  final bool isPassword;
  final bool obcureText;
  final bool isReadOnly;
  final Color borderColor;
  final TextInputType keyBoardType;
  final String? Function(String?)? validator;

  const MyTextField({
    Key? key,
    this.borderColor = AppColor.mainColor,
    this.controller,
    this.hintText,
    required this.isPassword,
    required this.obcureText,
    required this.isReadOnly,
    required this.labelText,
    this.prefixIcon,
    this.sufixIcon,
    required this.keyBoardType,
    this.validator,
  }) : super(key: key);

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 327,
      child: TextFormField(
        controller: widget.controller,
        readOnly: widget.isReadOnly,
        obscureText: widget.obcureText,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.mainColor, width: 2.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 1.0),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.pink, width: 1.0),
          ),
          hintText: widget.hintText,
          hintStyle: TextStyle(color: Colors.black, fontSize: 16),
          labelText: widget.labelText,
          labelStyle: TextStyle(color: Colors.black54, fontSize: 16),
          // prefixIcon: Icon(widget.prefixIcon),
          suffixIcon: widget.sufixIcon,
        ),
        validator: widget.validator,
      ),
    );
  }
}
