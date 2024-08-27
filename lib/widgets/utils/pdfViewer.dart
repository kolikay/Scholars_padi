import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pdfx/pdfx.dart';
import 'package:scholars_padi/widgets/reusesable_widget/normal_text.dart';
import 'package:scholars_padi/widgets/reusesable_widget/reusable_app_bar1.dart';

class PDFViewerScreen extends StatefulWidget {
  const PDFViewerScreen({Key? key}) : super(key: key);

  @override
  State<PDFViewerScreen> createState() => _PDFViewerScreenState();
}

class _PDFViewerScreenState extends State<PDFViewerScreen> {
  late PdfControllerPinch pdfControllerPinch;
  @override
  void initState() {
    super.initState();
    pdfControllerPinch = PdfControllerPinch(
        document: PdfDocument.openAsset('assets/pdf/sample.pdf'));
  }

  //   @override
  // void initState() {

  //   super.initState();
  //   pdfControllerPinch = PdfControllerPinch(
  //       document: PdfDocument.openData(InternetFile.get('https://hutchesonlab.fiu.edu/wp-content/uploads/sample-pdf.pdf')));
  // }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(103.h),
          child:  ReuseableAppBar1(
            backGroundColor: Colors.red,
          title: NormalText(
         
            text: 'CHM 101 Objective',
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
          firstAppIcon: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios, size: 25, color: Colors.white,),
          ),
          secondAppIcon: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search, size: 25, color: Colors.red,),
          ),
        ),
        ),
        body: SizedBox(
          height: 700.h,
          child: Column(
          children: [
            Expanded(
              child: PdfViewPinch(controller: pdfControllerPinch,),
            )
          ],
              ),
        ),
      ),
    );
  }

  // _buildUI() {
  //   return Column(
  //     children: [
  //       Expanded(
  //         child: PdfViewPinch(controller: pdfControllerPinch,),
  //       )
  //     ],
  //   );
  // }
}
