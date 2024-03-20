import 'package:assessment/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
        itemCount: 4,
        itemBuilder: (context , index){
        return const ListTile(
          title: Text("Contact"),
          leading: CircleAvatar(),
          subtitle: Text("Designation"),
        );
      }),
    );
  }
}