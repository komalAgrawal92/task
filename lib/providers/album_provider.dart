import 'package:flutter/material.dart';
import 'dart:convert';

class Album with ChangeNotifier {
  List<Map<String, dynamic>> albums = [];

  void getResponseJson(int index, dynamic _jsonResonse) {
    print('userId : $index');
    if (_jsonResonse.isNotEmpty) {
      List<Map> jsonData = List<Map>.from(json.decode(_jsonResonse));
      jsonData.forEach((Map album) {
        int userId = album['userId'];
        if (userId != null && userId == index) {
          albums.add(album);
          notifyListeners();
        }
      });
    }
  }
}
