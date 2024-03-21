import 'package:assessment/model/catergoryModel.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class DetailedPdfPage extends StatefulWidget {
   final SubCategory subCategory;
   final NestedData nestedData ;
  const DetailedPdfPage({super.key, required this.subCategory, required this.nestedData});

  @override
  State<DetailedPdfPage> createState() => _DetailedPdfPageState();
}

class _DetailedPdfPageState extends State<DetailedPdfPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title:  Text("${widget.nestedData.name}"),
        ),
        body: SfPdfViewer.asset("${widget.nestedData.url}"));
  }
}