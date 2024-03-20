import 'package:assessment/screens/RatesCalculation/ratesCalci.dart';
import 'package:assessment/screens/contact/contact.dart';
import 'package:flutter/material.dart';

class BottomRatesBar extends StatefulWidget {
  const BottomRatesBar({super.key});

  @override
  State<BottomRatesBar> createState() => _BottomRatesBarState();
}

class _BottomRatesBarState extends State<BottomRatesBar> {
  int _currentIndex = 0;
  List body = [const RatesCalculation(), const Contact()];
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
