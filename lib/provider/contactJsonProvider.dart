import 'dart:convert';
import 'package:assessment/model/contactModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ContactProvider extends ChangeNotifier {
  List<Contact> contactList = [];

Future<void> getContact() async {
    try {
      // Load JSON file from assets
      final String response =
          await rootBundle.loadString('assets/json/contact.json');

      // Parse JSON data
      final Map<String, dynamic> data = jsonDecode(response);

      // Extract "people" list from data
      final List<dynamic> peopleData = data['people'];

      // Convert JSON data to List<Contact>
      contactList = peopleData.map((json) => Contact.fromJson(json)).toList();
      print(contactList);
      notifyListeners();
    } catch (e) {
      print('Error loading contacts: $e');
    }
  }

}
