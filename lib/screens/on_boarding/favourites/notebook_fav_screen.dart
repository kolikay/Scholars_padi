import 'package:flutter/material.dart';
import 'package:scholars_padi/constants/appColor.dart';
import 'package:scholars_padi/widgets/reusesable_widget/normal_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget notebookfavScreen() {
  return SizedBox(
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(
        height: 15.h,
      ),
      NormalText(
        text: 'Note Book',
        fontWeight: FontWeight.bold,
        size: 19.2.sp,
        color: AppColor.mainColor,
      ),
      SizedBox(
        height: 15.h,
      ),
      const MaterialCards(
        cardColor1: Colors.blue,
        cardDate: 'March 13, 2022  08:53AM',
        cardMessage: 'About Dubai',
        cardColor2: Color(0xffd1ecfa),
      ),
      SizedBox(
        height: 15.h,
      ),
      const MaterialCards(
        cardColor1: Colors.pink,
        cardDate: 'March 13, 2022  08:53AM',
        cardMessage: 'School Materials',
        cardColor2: Color.fromARGB(255, 239, 120, 159),
      ),
      SizedBox(
        height: 15.h,
      ),
      const MaterialCards(
        cardColor1: Colors.yellowAccent,
        cardDate: 'March 13, 2022  08:53AM',
        cardMessage: 'Revision Materials',
        cardColor2: Color.fromARGB(255, 246, 239, 177),
      ),
    ]),
  );
}

class MaterialCards extends StatefulWidget {
  const MaterialCards(
      {Key? key,
      required this.cardMessage,
      required this.cardDate,
      required this.cardColor1,
      required this.cardColor2,
      this.ontap})
      : super(key: key);

  final String cardMessage;
  final String cardDate;
  final Color cardColor1;
  final Color cardColor2;
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
            color: widget.cardColor1,
          ),
          Expanded(
            child: InkWell(
              onTap: widget.ontap,
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
            ),
          )
        ],
      ),
    );
  }
}

















// informations cards
// class MaterialCards extends StatelessWidget {
//   const MaterialCards({
//     Key? key,
//     required this.cardMessage,
//   }) : super(key: key);

//   final String cardMessage;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 327,
//       height: 179.h,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(5.53.w),
//         border: Border.all(color: Colors.black12),
//       ),
//       child: InkWell(
//         onTap: () {
//           Navigator.of(context).push(
//             MaterialPageRoute(
//               builder: ((context) => const ScholarshipScreen5()),
//             ),
//           );
//         },
//         child: Column(
//           children: [
//             Container(
//               width: 327.w,
//               height: 90.h,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(5.w),
//                     bottomLeft: Radius.circular(5.w)),
//                 image: const DecorationImage(
//                   fit: BoxFit.cover,
//                   image: AssetImage('assets/images/matImage1.png'),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     children: [
//                       Container(
//                         color: Colors.white,
//                         child: Padding(
//                           padding: EdgeInsets.all(10.0.w),
//                           child: SizedBox(
//                             height: 42.h,
//                             width: 235.w,
//                             child: NormalText(
//                               text: cardMessage,
//                               color: Colors.black,
//                               size: 14.sp,
//                             ),
//                           ),
//                         ),
//                       ),
//                       IconButton(
//                         onPressed: () {},
//                         icon: const Icon(Icons.more_vert),
//                       ),
//                     ],
//                   ),
//                   NormalText(
//                     text: '22/07/2022',
//                     size: 14.sp,
//                     color: AppColor.dullBlack,
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
