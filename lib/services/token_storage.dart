import 'package:shared_preferences/shared_preferences.dart';

const String tokenKey = 'jwt_token';

Future<void> saveToken(String token) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString(tokenKey, token);
}

Future<String?> getToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString(tokenKey);
}

Future<void> clearToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove(tokenKey);
}
