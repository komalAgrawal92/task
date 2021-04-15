import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class User with ChangeNotifier {
  String _userUrl = "https://jsonplaceholder.typicode.com/users";

  User();

  String _jsonResonse = "";
  bool _isFetching = false;

   
  bool get isFetching => _isFetching;

  Future<void> fetchData() async {
    _isFetching = true;
    notifyListeners();

    var response = await http.get(Uri.parse(_userUrl));
    if (response.statusCode == 200) {
      _jsonResonse = response.body;
    }
     
    _isFetching = false;
    notifyListeners();
  }

 
  List<dynamic> getResponseJson() {
    
    if (_jsonResonse.isNotEmpty) {
      var jsonData = json.decode(_jsonResonse);
      
        return jsonData;
        
    }
    return null;
    
  }
}