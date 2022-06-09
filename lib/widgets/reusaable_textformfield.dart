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

  MyTextField(
      {Key? key,
      this.borderColor = AppColor.mainColor,
      this.controller,
      this.hintText,
      required this.isPassword,
      required this.obcureText,
      required this.isReadOnly,
      required this.labelText,
      this.prefixIcon,
      this.sufixIcon,
      required this.keyBoardType})
      : super(key: key);

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        controller: widget.controller,
        readOnly: widget.isReadOnly,
        obscureText: widget.obcureText,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.mainColor, width: 2.0)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 1.0)),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.pink, width: 1.0)),
          hintText: widget.hintText,
          hintStyle: TextStyle(color: AppColor.mainColor),
          labelText: widget.labelText,
          labelStyle: TextStyle(color: AppColor.mainColor),
          prefixIcon: Icon(widget.prefixIcon),
          suffixIcon: widget.sufixIcon,
        ),
      ),
    );
  }
}


// class MyTextFormField1 extends StatelessWidget {
//     final TextEditingController? controller;
//   final  String? hintText;
//   final String label;
//   final IconData? prefixIcon;
//   final IconData? sufixIcon;
//   final bool? isPassword;
//   final bool? isReadOnly;
//   final Color borderColor;

//    MyTextFormField1({Key? key, 
//     this.borderColor = AppColor.mainColor,
//     this.controller,
//     required this.hintText,
//     this.isPassword,
//     this.isReadOnly,
//     required this.label,
//     this.prefixIcon,
//     this.sufixIcon

//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: TextFormField(
//         decoration:InputDecoration(
//           focusedBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: AppColor.mainColor, width: 1.0)
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: Colors.black, width: 1.0)
//           ),
//           border: OutlineInputBorder(
//             borderSide: BorderSide(color: Colors.pink, width: 1.0)
//           ),
//          labelText: labelText,

//         ),
        
//       ),
      
//     );
//   }
  
// }
// class BoxTextField extends StatelessWidget {
//   final TextEditingController controller;
//   final FormFieldValidator<String> validator;
//   final bool obsecure;
//   final bool readOnly;
//   final VoidCallback onTap;
//   final VoidCallback onEditingCompleted;
//   final TextInputType keyboardType;
//   final ValueChanged<String> onChanged;
//   final bool isMulti;
//   final bool autofocus;
//   final bool enabled;
//   final String errorText;
//   final String label;
//   final Widget suffix;
//   final Widget prefix;

//   BoxTextField(
//       {Key key,
//       this.controller,
//       this.validator,
//       this.keyboardType = TextInputType.text,
//       this.obsecure = false,
//       this.onTap,
//       this.isMulti = false,
//       this.readOnly = false,
//       this.autofocus = false,
//       this.errorText,
//       required this.label,
//       this.suffix,
//       this.prefix,
//       this.enabled = true,
//       this.onEditingCompleted,
//       this.onChanged})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: 4),
//       child: TextFormField(
//           onChanged: onChanged,
//           onEditingComplete: onEditingCompleted,
//           autofocus: autofocus,
//           minLines: isMulti ? 4 : 1,
//           maxLines: isMulti ? null : 1,
//           onTap: onTap,
//           enabled: enabled,
//           readOnly: readOnly,
//           obscureText: obsecure,
//           keyboardType: keyboardType,
//           controller: controller,
//           decoration: InputDecoration(
//             errorText: errorText,
//             prefixIcon: prefix,
//             suffixIcon: suffix,
//             labelText: label,
//             hintStyle: TextStyle(color: Colors.blueGrey, fontSize: 15),
//           ),
//           validator: validator),
//     );
//   }
// }