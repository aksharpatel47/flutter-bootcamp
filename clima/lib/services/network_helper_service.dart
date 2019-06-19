import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkHelper {
  Future<dynamic> get<T>(String url) async {
    final response = await http.get(url);
    // TODO: add additional checks if the api gives an error.
    return json.decode(response.body);
  }
}