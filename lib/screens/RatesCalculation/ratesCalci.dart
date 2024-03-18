import 'package:assessment/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RatesCalculation extends StatefulWidget {
  const RatesCalculation({Key? key}) : super(key: key);

  @override
  _RatesCalculationState createState() => _RatesCalculationState();
}

class _RatesCalculationState extends State<RatesCalculation> {
  TextEditingController usdController = TextEditingController();
  double inrValue = 0.0;

  @override
  void dispose() {
    usdController.dispose();
    super.dispose();
  }

  void convertToINR(String value) {
    setState(() {
      if (value.isEmpty) {
        inrValue = 0.0;
      } else {
        double usd = double.tryParse(value) ?? 0.0;
        // Conversion rate (for example)
        double conversionRate = 82.0;
        inrValue = usd * conversionRate;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: scaffoldBackground,
        title: Text(
          "Rates Calculation",
          style: TextStyle(
            fontSize: ScreenUtil().setSp(19),
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usdController,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(),

                labelText: 'USD',
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                convertToINR(value);
              },
            ),
            SizedBox(height: 20),
            Text(
              'INR: $inrValue',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
