import 'package:assessment/screens/companydetails/campanyDetails.dart';
import 'package:assessment/screens/contact/contact.dart';
import 'package:flutter/material.dart';

class BottomCompanyBar extends StatefulWidget {
  const BottomCompanyBar({super.key});

  @override
  State<BottomCompanyBar> createState() => _BottomCompanyBarState();
}

class _BottomCompanyBarState extends State<BottomCompanyBar> {
  int _currentIndex = 0;
  List body = [const CompanyDetails(), const Contact()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: (newValue) {
            setState(() {
              _currentIndex = newValue;
            });
          },
          currentIndex: _currentIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.call), label: "Contact"),
          ]),
    );
  }
}
