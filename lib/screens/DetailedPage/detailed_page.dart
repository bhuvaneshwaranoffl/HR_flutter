// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:assessment/model/catergoryModel.dart';
import 'package:assessment/provider/jsonProvider.dart';
import 'package:assessment/screens/DetailedPage/pdf_detailed_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:assessment/utils/constant.dart';
import 'package:assessment/widget/reusabletile.dart';
import 'package:provider/provider.dart';

class DetailedHrPolicies extends StatefulWidget {
  final int categoryIndex;
  final Category category;
  final SubCategory subCategory;
  const DetailedHrPolicies({
    super.key,
    required this.subCategory,
    required this.category,
    required this.categoryIndex,
  });

  @override
  State<DetailedHrPolicies> createState() => _DetailedHrPoliciesState();
}

class _DetailedHrPoliciesState extends State<DetailedHrPolicies> {
  @override
  Widget build(BuildContext context) {
    // Get the nested data from the provider

    return Scaffold(
        appBar: AppBar(
          backgroundColor: scaffoldBackground,
          title: Text(
            "${widget.subCategory.name}",
            style: TextStyle(
              //color: Colors.white,
              fontSize: ScreenUtil().setSp(19),
            ),
          ),
          centerTitle: true,
        ),
        body: ListView.builder(
            itemCount: widget.subCategory.value?.length ?? 0,
            itemBuilder: (context, index) {
              // final getData = Provider.of<CategoryProvider>(context, listen: true);
              // final category = getData.categories[widget.categoryIndex];
              // final List<SubCategory> subCategories = category.value ?? [];
              final currentSubCategoryItem = widget.subCategory.value![index];
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                child: Reusabletile(
                    image: AssetImage("${currentSubCategoryItem.img}"),
                    text: "${currentSubCategoryItem.name}",
                    press: () {
                      
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailedPdfPage(
                                  subCategory: widget.subCategory,
                                  nestedData: currentSubCategoryItem)));
                    }),
              );
            }));
  }
}
