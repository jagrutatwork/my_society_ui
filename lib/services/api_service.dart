import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  static const String baseUrl = 'http://localhost:8080'; // adjust this
  static const String _tokenKey = 'auth_token'; // Define the token key

  // Login method to authenticate the user
  static Future<String?> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/auth/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      String token = data['token']; // Adjust the key based on your backend response
      await _saveToken(token);  // Save the token to shared preferences
      return token;
    } else {
      throw Exception('Login failed: ${response.body}');
    }
  }

  // Method to save token to shared preferences
  static Future<void> _saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
  }

  // Method to fetch protected data using the stored token
  Future<void> fetchProtectedData() async {
    String? token = await getToken();

    if (token == null) {
      print("Token not found. User might not be logged in.");
      return;
    }

    final response = await http.get(
      Uri.parse('$baseUrl/protected-data'),  // Adjust the endpoint for your API
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      print("Data: ${response.body}");
    } else {
      print("Failed to fetch: ${response.statusCode} ${response.body}");
    }
  }

  // Method to get the stored token from shared preferences
  static Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);  // Retrieve the token
  }

  // Logout method to clear the stored token
  static Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);  // Clear the token when logging out
  }
}
