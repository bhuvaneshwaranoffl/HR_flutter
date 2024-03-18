import 'package:assessment/provider/jsonProvider.dart';
import 'package:assessment/screens/HR%20Policy/hrPolicy.dart';
import 'package:assessment/screens/RatesCalculation/ratesCalci.dart';
import 'package:assessment/screens/companydetails/campanyDetails.dart';
import 'package:assessment/screens/enquiry%20form/form.dart';
import 'package:assessment/utils/constant.dart';
import 'package:assessment/widget/reusabletile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    final getData = Provider.of<CategoryProvider>(context, listen: false);
    getData.readJson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final getData = Provider.of<CategoryProvider>(context, listen: true);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Good Morning...",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).primaryColor,
                        fontSize:
                            Theme.of(context).textTheme.headlineLarge!.fontSize,
                        // You can add other properties of the headlineLarge style here if needed
                      ),
                    ),
                    Icon(
                      Icons.notifications,
                      color: primaryColor,
                      size: 30,
                    )
                  ],
                )),
            Expanded(
              child: ListView.builder(
                  itemCount: getData.categories.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 10.h),
                      child: Reusabletile(
                        text: getData.categories[index].name,
                        image: AssetImage(getData.categories[index].img),
                        press: () {
                          if (getData.categories[index].name ==
                              'CompanyDetails') {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const CompanyDetails()));
                          }
                          if (getData.categories[index].name ==
                              'HR Policies') {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HRPolicy(categoryIndex: 1,)));
                          }
                          if (getData.categories[index].name ==
                              'RatesCalculation') {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const RatesCalculation()));
                          }
                          if (getData.categories[index].name ==
                              'EnquiryForm') {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const EnquiryForm()));
                          }
                        },
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
