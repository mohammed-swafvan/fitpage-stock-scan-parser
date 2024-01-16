import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  static String apiKey = 'http://coding-assignment.bombayrunning.com/data.json';

  Future<List<dynamic>> fetchData() async {
    final response = await http.get(Uri.parse(apiKey));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }
}


