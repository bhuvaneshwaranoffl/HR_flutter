import 'package:assessment/model/catergoryModel.dart';
import 'package:assessment/provider/jsonProvider.dart';
import 'package:assessment/screens/DetailedPage/detailed_page.dart';
import 'package:assessment/screens/contact/contact.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomDetailedHrBar extends StatefulWidget {
  final int categoryIndex;
  final int subCategoryIndex; // Define the index you want to use here
  const BottomDetailedHrBar(
      {Key? key, required this.categoryIndex, required this.subCategoryIndex})
      : super(key: key);

  @override
  State<BottomDetailedHrBar> createState() => _BottomDetailedHrBarState();
}

class _BottomDetailedHrBarState extends State<BottomDetailedHrBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final getData = Provider.of<CategoryProvider>(context, listen: true);
    final category = getData.categories[widget.categoryIndex];
    final List<SubCategory> subCategories = category.value ?? [];
    List<Widget> body = [
      DetailedHrPolicies(
        subCategory: subCategories[
            widget.subCategoryIndex], // Use the specified subCategoryIndex here
        category: category,
        categoryIndex: 1,
      ),
      const Contact()
    ];
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
        ],
      ),
    );
  }
}
