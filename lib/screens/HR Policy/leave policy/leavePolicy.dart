import 'package:assessment/utils/constant.dart';
import 'package:assessment/widget/reusabletile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LeavePolicy extends StatefulWidget {
  const LeavePolicy({super.key});

  @override
  State<LeavePolicy> createState() => _LeavePolicyState();
}

class _LeavePolicyState extends State<LeavePolicy> {
  @override
  Widget build(BuildContext context) {
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
      body:SafeArea(
        
        child: ListView.builder(
          itemCount: 4,
          itemBuilder: (context , index){
          return  Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 22.w),
            child: Reusabletile(image: AssetImage(""), text: "", press:(){
            
                  }),
          );
        }),
      )
    );
  }
}