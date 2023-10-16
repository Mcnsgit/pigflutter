import 'dart:convert';
import 'package:http/http.dart' as http;

class DataService {
  Future<Map<String, dynamic>> fetchData(String url) async {
    http.Response response;

    try {
      response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to load data');
    }
  }
}
