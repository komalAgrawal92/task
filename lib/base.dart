import 'package:http/http.dart' as http;

class BaseClass {
  static String _jsonResonse = "";
  static bool isFetching = false;

  static Future<String> fetchData(String subUrl) async {
    isFetching = true;

    String baseUrl = "https://jsonplaceholder.typicode.com/$subUrl";
    try {
      var response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        _jsonResonse = response.body;
      }
      isFetching = false;
      return _jsonResonse;
    } catch (e) {
      print(e);
    }
  }
}
