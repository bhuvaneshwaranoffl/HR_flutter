import 'package:assessment/model/catergoryModel.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class EarnedLeave extends StatefulWidget {
     final List<NestedData> nestedDataList;
  const EarnedLeave({Key? key, required this.nestedDataList}) : super(key: key);

  @override
  _EarnedLeaveState createState() => _EarnedLeaveState();
}

class _EarnedLeaveState extends State<EarnedLeave> {
  String pdfPath = 'assets/pdf/proposal.pdf'; // Path to your PDF file

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Earned Leave"),
        ),
        body: SfPdfViewer.asset(widget.nestedDataList[1].url.toString()));
  }
}
