import 'package:flutter/material.dart';
import 'dart:convert';

class User with ChangeNotifier {
  List<Map<String, dynamic>> userItems = [];

  void getResponseJson(String _jsonResonse) {
    if (_jsonResonse.isNotEmpty) {
      List<Map> jsonData = List<Map>.from(json.decode(_jsonResonse));
      jsonData.forEach((Map user) {
        userItems.add(user);
        notifyListeners();
      });
    }
  }
}
