import 'package:assessment/model/catergoryModel.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class CasualLeave extends StatefulWidget {
     final List<NestedData> nestedDataList;
  const CasualLeave({Key? key, required this.nestedDataList}) : super(key: key);

  @override
  _CasualLeaveState createState() => _CasualLeaveState();
}

class _CasualLeaveState extends State<CasualLeave> {
  String pdfPath = 'assets/pdf/proposal.pdf'; // Path to your PDF file

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Casual Leave"),
        ),
        body: SfPdfViewer.asset(widget.nestedDataList[2].url.toString()));
  }
}
