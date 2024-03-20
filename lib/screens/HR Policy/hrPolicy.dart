import 'package:assessment/model/catergoryModel.dart';
import 'package:assessment/provider/jsonProvider.dart';
import 'package:assessment/utils/constant.dart';
import 'package:assessment/widget/reusabletile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HRPolicy extends StatefulWidget {
  final int categoryIndex;
  const HRPolicy({
    super.key,
    required this.categoryIndex,
  });

  @override
  State<HRPolicy> createState() => _HRPolicyState();
}

class _HRPolicyState extends State<HRPolicy> {
    void initState() {
    final getData = Provider.of<CategoryProvider>(context, listen: false);
    getData.fetchCategories();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
     final getData = Provider.of<CategoryProvider>(context, listen: true);
    final category = getData.categories[widget.categoryIndex];
   final List<SubCategory> subCategories = category.value ?? [];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: scaffoldBackground,
        title: Text(
          "HR Policy",
          style: TextStyle(
            //color: Colors.white,
            fontSize: ScreenUtil().setSp(19),
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount:subCategories.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              child: Reusabletile(
                  image: AssetImage(subCategories[index].img),
                  text:subCategories[index].name,
                  press: () {
                   
                  }),
            );
          }),
    );
  }
}
