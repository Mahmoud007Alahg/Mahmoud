import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "https://example.com/api";

  Future<dynamic> loginUser(String userId, String password) async {
    final response = await http.post(
      Uri.parse("$baseUrl/login"),
      headers: {"Content-Type": "application/json"},
      body: json.encode({
        "id": userId,
        "password": password,
      }),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return json.decode(response.body);
    } else {
      throw Exception("فشل تسجيل الدخول: ${response.body}");
    }
  }
}