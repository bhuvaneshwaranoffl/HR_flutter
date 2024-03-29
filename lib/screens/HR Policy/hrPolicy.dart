import 'package:assessment/controller/ChildBottomBar/detailed_page_bottom.dart';
import 'package:assessment/model/catergoryModel.dart';
import 'package:assessment/provider/jsonProvider.dart';
import 'package:assessment/screens/DetailedPage/detailed_page.dart';
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
          itemCount: subCategories.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              child: Reusabletile(
                  image: AssetImage(subCategories[index].img),
                  text: subCategories[index].name,
                  press: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => 
                           BottomDetailedHrBar(categoryIndex: 1,
                            subCategoryIndex: index)
                                // DetailedHrPolicies(
                                // subCategory: subCategories[index],
                                // category: category, categoryIndex: 1,)
                                ));
                  }),
            );
          }),
    );
  }
}
