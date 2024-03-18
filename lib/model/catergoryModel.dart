import 'dart:convert';
import 'package:assessment/model/data.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class SubCategory {
  final String name;
  final String img;
 // final List<Data> value; 
  SubCategory( {
    required this.name,
    required this.img,
   // required this.value,
  });

  factory SubCategory.fromJson(Map<String, dynamic> json) {
    return SubCategory(
      name: json['name'],
      img: json['img'],
     // value: json['value']
    );
  }
}

class Category {
  final String name;
  final String img;
  final String? url;
  final List<SubCategory>? value;

  Category({
    required this.name,
    required this.img,
    this.url,
    this.value,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      name: json['name'],
      img: json['img'],
      url: json['url'],
      value: json['value'] != null
          ? List<SubCategory>.from(
              json['value'].map((x) => SubCategory.fromJson(x)))
          : null,
    );
  }
}

