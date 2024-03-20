import 'dart:convert';// Corrected import
import 'package:assessment/model/catergoryModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CategoryProvider extends ChangeNotifier {
  List<Category> categories = [];

  Future<void> fetchCategories() async {
    try {
      final String response =
          await rootBundle.loadString("assets/json/data.json");
      final data = jsonDecode(response);
      final List<dynamic> categoryList = data['category'];
      categories = categoryList.map((json) => Category.fromJson(json)).toList();

      // Print all the categories
      for (var category in categories) {
        print('Name: ${category.name}');
        print('Code: ${category.code}');
        print('Creation Date: ${category.creationDate}');
        print('Type: ${category.type}');
        print('Img: ${category.img}');
        print('URL Type: ${category.urlType}');
        print('URL: ${category.url}');
        if (category.value != null) {
          print('Subcategories:');
          for (var subCategory in category.value!) {
            print('  Name: ${subCategory.name}');
            print('  Code: ${subCategory.code}');
            print('  Creation Date: ${subCategory.creationDate}');
            print('  Type: ${subCategory.type}');
            print('  Img: ${subCategory.img}');
            if (subCategory.value != null) {
              print('  Nested Data:');
              for (var nestedData in subCategory.value!) {
                print('    Name: ${nestedData.name}');
                print('    Code: ${nestedData.code}');
                print('    Creation Date: ${nestedData.creationDate}');
                print('    Type: ${nestedData.type}');
                print('    Img: ${nestedData.img}');
                print('    URL Type: ${nestedData.urlType}');
                print('    URL: ${nestedData.url}');
              }
            }
          }
        }
        print('\n');
      }

      notifyListeners();
    } catch (error) {
      print('Error fetching JSON data: $error');
    }
  }
}
