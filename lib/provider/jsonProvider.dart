import 'dart:convert';

import 'package:assessment/model/catergoryModel.dart';
import 'package:assessment/model/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CategoryProvider extends ChangeNotifier {
  List<Category> categories = [];
  Future<void> readJson() async {
    try {
      final String response =
          await rootBundle.loadString("assets/json/data.json");
      final data = jsonDecode(response);
      final List<dynamic> categoryList = data['category'];
      categories = categoryList.map((json) => Category.fromJson(json)).toList();
     // Print img, name, and url for each category
      for (int index = 0; index < categories.length; index++) {
        print('Category $index:');
        print('Img: ${categories[index].img}');
        print('Name: ${categories[index].name}');
        print('URL: ${categories[index].url}');
      }
      notifyListeners();
    } catch (error) {
      print('Error reading JSON file: $error');
    }
  }
  List<SubCategory> fetchSubCategories(int categoryIndex) {
    if (categoryIndex >= 0 && categoryIndex < categories.length) {
      return categories[categoryIndex].value ?? [];
    } else {
      return [];
    }
  }
  //  List<Data> fetchNestedData(int categoryIndex, int subCategoryIndex) {
  //   if (categoryIndex >= 0 &&
  //       categoryIndex < categories.length &&
  //       subCategoryIndex >= 0 &&
  //       subCategoryIndex < categories[categoryIndex].value!.length) {
  //     return categories[categoryIndex].value![subCategoryIndex].value ?? [];
  //   } else {
  //     return [];
  //   }
 /// }
}



