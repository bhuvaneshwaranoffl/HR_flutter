import 'package:assessment/screens/HR%20Policy/hrPolicy.dart';
import 'package:assessment/screens/contact/contact.dart';
import 'package:flutter/material.dart';

class BottomHrPoliciesBar extends StatefulWidget {
  const BottomHrPoliciesBar({super.key});

  @override
  State<BottomHrPoliciesBar> createState() => _BottomHrPoliciesBarState();
}

class _BottomHrPoliciesBarState extends State<BottomHrPoliciesBar> {
  int _currentIndex = 0;
  List body = [const HRPolicy(categoryIndex: 1), const Contact()];
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
