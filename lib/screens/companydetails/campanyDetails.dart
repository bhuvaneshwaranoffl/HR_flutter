
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';


class CompanyDetails extends StatefulWidget {
  const CompanyDetails({Key? key}) : super(key: key);

  @override
  _CompanyDetailsState createState() => _CompanyDetailsState();
}

class _CompanyDetailsState extends State<CompanyDetails> {
  String pdfPath = 'assets/pdf/proposal.pdf'; // Path to your PDF file

  @override
  Widget build(BuildContext context) {
     return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Company details"),
        ),
        body:
       
        SfPdfViewer.asset(pdfPath)
      
        );
  }
}
