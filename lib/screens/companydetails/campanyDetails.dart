
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../provider/jsonProvider.dart';


class CompanyDetails extends StatefulWidget {
  const CompanyDetails({Key? key}) : super(key: key);

  @override
  _CompanyDetailsState createState() => _CompanyDetailsState();
}

class _CompanyDetailsState extends State<CompanyDetails> {
  void initState() {
    final getData = Provider.of<CategoryProvider>(context, listen: false);
    getData.fetchCategories();
    super.initState();
  } // Path to your PDF file

  @override
  Widget build(BuildContext context) {
    final getData = Provider.of<CategoryProvider>(context, listen: true);
     return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Company details"),
        ),
        body:
       
        SfPdfViewer.asset(getData.categories[0].url.toString())
      
        );
  }
}
