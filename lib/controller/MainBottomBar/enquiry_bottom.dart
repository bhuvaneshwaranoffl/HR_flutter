import 'package:assessment/screens/contact/contact.dart';
import 'package:assessment/screens/enquiry%20form/form.dart';
import 'package:flutter/material.dart';

class BottomEnquiryBar extends StatefulWidget {
  const BottomEnquiryBar({super.key});

  @override
  State<BottomEnquiryBar> createState() => _BottomEnquiryBarState();
}

class _BottomEnquiryBarState extends State<BottomEnquiryBar> {
  int _currentIndex = 0;
  List body = [const EnquiryForm(), const Contact()];
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
