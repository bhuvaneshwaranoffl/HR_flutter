import 'package:assessment/screens/contact/contact.dart';
import 'package:assessment/screens/home_page.dart';
import 'package:flutter/material.dart';
class BottomHomeBar extends StatefulWidget {
  const BottomHomeBar({super.key});

  @override
  State<BottomHomeBar> createState() => _BottomHomeBarState();
}

class _BottomHomeBarState extends State<BottomHomeBar> {
   int _currentIndex = 0;
   List body =[
    const HomePage(),const Contact()
   ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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