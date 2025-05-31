// services/theme_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/theme_model.dart';

class ThemeService {
 static const String apiUrl = 'http://10.0.2.2:8000/api/themes/';

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
