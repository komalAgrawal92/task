import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Album with ChangeNotifier {
  var userId;
  String _albumUrl = "https://jsonplaceholder.typicode.com/albums";

  Album();

  String _jsonResonse = "";
  bool _isFetching = false;

  bool get isFetching => _isFetching;

  Future<void> fetchData(int userId) async {
    userId = userId;
    _isFetching = true;
    notifyListeners();

    var response = await http.get(Uri.parse(_albumUrl));
    if (response.statusCode == 200) {
      _jsonResonse = response.body;
    }

    _isFetching = false;
    notifyListeners();
  }

  List<dynamic> getResponseJson(int index) {
    if (_jsonResonse.isNotEmpty) {
      List<Map<String, dynamic>> albums = [];
      List<Map> jsonData = List<Map>.from(json.decode(_jsonResonse));
      jsonData.forEach((Map album) {
        int userId = album['userId'];
        if (userId != null && userId == index) {
          albums.add(album);
        }
      });
      
      return albums;
    }
    return [];
  }
}
