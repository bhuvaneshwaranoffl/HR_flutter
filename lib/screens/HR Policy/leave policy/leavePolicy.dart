import 'package:assessment/model/catergoryModel.dart';
import 'package:assessment/provider/jsonProvider.dart';
import 'package:assessment/screens/HR%20Policy/leave%20policy/casualLeave.dart';
import 'package:assessment/screens/HR%20Policy/leave%20policy/earnedLeave.dart';
import 'package:assessment/screens/HR%20Policy/leave%20policy/sickLeave.dart';
import 'package:assessment/screens/contact/contact.dart';
import 'package:assessment/utils/constant.dart';
import 'package:assessment/widget/reusabletile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class LeavePolicy extends StatefulWidget {
   final int categoryIndex;
  final List<NestedData> nestedDataList;
  const LeavePolicy({super.key, required this.nestedDataList, required this.categoryIndex});

  @override
  State<LeavePolicy> createState() => _LeavePolicyState();
}

class _LeavePolicyState extends State<LeavePolicy> {
  int _currentIndex =0;
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
            "Leave Policy",
            style: TextStyle(
              //color: Colors.white,
              fontSize: ScreenUtil().setSp(19),
            ),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: ListView.builder(
              itemCount: widget.nestedDataList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.h, horizontal: 22.w),
                  child: Reusabletile(
                      image: AssetImage(widget.nestedDataList[index].img),
                      text: widget.nestedDataList[index].name,
                      press: () {
                        if (widget.nestedDataList[index].name == widget.nestedDataList[0].name) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context)
                                   =>  SickLeave(nestedDataList: subCategories[0].value??[],)));
                        }

                        if (widget.nestedDataList[index].name == widget.nestedDataList[1].name) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>  CasualLeave(
                                        nestedDataList:
                                            subCategories[0].value ?? [],
                                      )));
                        }

                        if (widget.nestedDataList[index].name == widget.nestedDataList[2].name) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>  EarnedLeave(
                                        nestedDataList:
                                            subCategories[0].value ?? [],
                                      )));
                        }
                      }),
                );
              }),
             
        ),
         bottomNavigationBar: BottomNavigationBar(
              onTap: (newValue) {
                setState(() {
                  _currentIndex =newValue;
                  if (newValue==1) {
                    Navigator.push(
                      context, MaterialPageRoute(
                        builder: (context)=>const Contact()));
                  } 
                });
              },
              currentIndex: _currentIndex,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.call), label: "Contact"),
              ]),
        );
  }
}
