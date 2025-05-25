import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

Future<bool> login(String username, String password) async {
  late Uri url;

  if (Platform.isAndroid) {
    url = Uri.parse('http://10.0.2.2:8000/api/token/');
  } else if (Platform.isIOS) {
    url = Uri.parse('http://localhost:8000/api/token/');
  } else {
    url = Uri.parse('http://localhost:8000/api/token/');
  }
  final response = await http.post(
    url,
    headers: {
      'Content-Type': 'application/json',
    },

    body: jsonEncode({
      'username': username,
      'password': password,
    }),
  );

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    final access = data['access'];
    final refresh = data['refresh'];

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('access_token', access);
    await prefs.setString('refresh_token', refresh);
    return true;
  } else {
    return false;
  }
}
