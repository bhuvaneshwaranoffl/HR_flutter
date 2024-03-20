import 'package:assessment/model/catergoryModel.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class SickLeave extends StatefulWidget {
   final List<NestedData> nestedDataList;
  const SickLeave({Key? key, required this.nestedDataList}) : super(key: key);

  @override
  _SickLeaveState createState() => _SickLeaveState();
}

class _SickLeaveState extends State<SickLeave> {
  String pdfPath = 'assets/pdf/proposal.pdf'; // Path to your PDF file

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Sick Leave"),
        ),
        body: SfPdfViewer.asset(widget.nestedDataList[0].url.toString()));
  }
}
