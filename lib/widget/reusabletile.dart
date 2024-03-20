// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:assessment/utils/constant.dart';
class Reusabletile extends StatelessWidget {
   final ImageProvider<Object> image;
   final String text;
   final Function()? press;
  
  const Reusabletile({
    super.key,
    required this.image,
    required this.text,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
     final Orientation orientation = MediaQuery.of(context).orientation;

     double containerHeight = orientation == Orientation.portrait ? 80.h : 100.h;
    return GestureDetector(
      onTap:press,
      child: Container(
        height: containerHeight,
        decoration: BoxDecoration(
            image: DecorationImage(
              image:image,
              fit: BoxFit.cover,
              filterQuality: FilterQuality.low,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(
                    0.5), // Adjust the opacity as needed (0.0 to 1.0)
                BlendMode.darken, // You can change the blend mode as needed
              ),
            ),
            color: primaryColor,
            borderRadius: BorderRadius.circular(10.r)),
        child: Padding(
          padding: EdgeInsets.all(ScreenUtil().setWidth(8.0)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: ScreenUtil().setHeight(19),
                    fontWeight: FontWeight.w600),
              ),
              Icon(
                Icons.arrow_circle_right_outlined,
                color: Colors.white,
                size: 30.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
