import 'package:flutter/material.dart';
import 'dart:convert';

class Photo with ChangeNotifier {
  List<Map<String, dynamic>> photos = [];

  void getResponseJson(int index, dynamic _jsonResonse) {
    print('albumId : $index');
    if (_jsonResonse.isNotEmpty) {
      List<Map> jsonData = List<Map>.from(json.decode(_jsonResonse));
      jsonData.forEach((Map photo) {
        int albumId = photo['albumId'];
        if (albumId != null && albumId == index) {
          photos.add(photo);
          notifyListeners();
        }
      });
    }
  }
}
