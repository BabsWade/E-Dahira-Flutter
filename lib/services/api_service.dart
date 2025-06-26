import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../models/theme.dart';

class ApiService {
  //static const String apiUrl = 'http://10.0.2.2:8000/api/themes/';
  static String get apiUrl {
    if (Platform.isAndroid) {
      return 'http://10.0.2.2:8000/api/themes/'; // Émulateur Android
    } else if (Platform.isIOS) {
      return 'http://localhost:8000/api/themes/'; // iOS Simulator
    } else {
      return 'http://localhost:8000/api/themes/'; // Fallback
    }
  }

  static Future<List<ThemeModel>> fetchThemes() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      final List<dynamic> data = jsonData['results'];

      return data.map((item) => ThemeModel.fromJson(item)).toList();
    } else {
      throw Exception('Erreur de chargement des thèmes');
    }
  }
}
