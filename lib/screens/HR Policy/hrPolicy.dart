import 'package:assessment/model/catergoryModel.dart';
import 'package:assessment/provider/jsonProvider.dart';
import 'package:assessment/screens/HR%20Policy/leave%20policy/leavePolicy.dart';
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
    var categoryProvider = Provider.of<CategoryProvider>(context);
    var subCategories = categoryProvider.fetchSubCategories(1);
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
              padding: const EdgeInsets.all(10.0),
              child: Reusabletile(
                  image: AssetImage(subCategories[index].img),
                  text:subCategories[index].name,
                  press: () {
                    if (subCategories[index].name=='Leave Policies') {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LeavePolicy()));
                    }
                  }),
            );
          }),
    );
  }
}
