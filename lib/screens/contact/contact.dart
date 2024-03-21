import 'package:assessment/provider/contactJsonProvider.dart';
import 'package:assessment/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Contact extends StatefulWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  void initState() {
    super.initState();
    // Fetch contact data when the widget is initialized
    Provider.of<ContactProvider>(context, listen: false).getContact();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: scaffoldBackground,
        title: Text(
          "HR Policy",
          style: TextStyle(
            fontSize: ScreenUtil().setSp(19),
          ),
        ),
        centerTitle: true,
      ),
      body: Consumer<ContactProvider>(
        builder: (context, contactProvider, _) {
          if (contactProvider.contactList.isEmpty) {
            return const Center(
              child:
                  CircularProgressIndicator(), // Show loading indicator while data is being fetched
            );
          } else {
            return ListView.builder(
              itemCount: contactProvider.contactList.length,
              itemBuilder: (context, index) {
                final contact = contactProvider.contactList[index];
                return Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                  child: Container(
                    height: 80.h,
                    decoration: BoxDecoration(
                        color: tilethreeColor,
                        borderRadius: BorderRadius.circular(10.r)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 6.5.h,),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            foregroundColor: Colors.amber[50],
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                contact.name,
                                style: const TextStyle(
                                  fontSize: 17,
                                ),
                              ),
                              Text(
                                contact.designation,
                                style: TextStyle(
                                    fontSize: 14, color: Colors.grey[350]),
                              ),
                              Text(
                                contact.mobile,
                                style: TextStyle(
                                    fontSize: 14, color: Colors.grey[350]),
                              ),
                              Text(
                                contact.email,
                                style: TextStyle(
                                    fontSize: 14, color: Colors.grey[350]),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
