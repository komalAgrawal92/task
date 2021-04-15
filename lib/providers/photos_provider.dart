import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Photo with ChangeNotifier {
  var userId;
  String _photoUrl = "https://jsonplaceholder.typicode.com/photos";

  Photo();

  String _jsonResonse = "";
  bool _isFetching = false;

  bool get isFetching => _isFetching;

  Future<void> fetchData(int userId) async {
    userId = userId;
    _isFetching = true;
    notifyListeners();

    var response = await http.get(Uri.parse(_photoUrl));
    if (response.statusCode == 200) {
      _jsonResonse = response.body;
    }

    _isFetching = false;
    notifyListeners();
  }

  List<dynamic> getResponseJson(int index) {
    if (_jsonResonse.isNotEmpty) {
      List<Map<String, dynamic>> photos = [];
      List<Map> jsonData = List<Map>.from(json.decode(_jsonResonse));
      jsonData.forEach((Map photo) {
        int albumId = photo['albumId'];
        if (albumId != null && albumId == index) {
          photos.add(photo);
        }
      });
     
      return photos;
    }
    return [];
  }
}
