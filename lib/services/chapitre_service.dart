import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../models/chapitre_model.dart';

class ChapitreService {
  //static const String baseUrl = 'http://10.0.2.2:8000/api/chapitres/';
  static String get apiUrl {
    if (Platform.isAndroid) {
      return 'http://10.0.2.2:8000/api/chapitres/'; // Émulateur Android
    } else if (Platform.isIOS) {
      return 'http://localhost:8000/api/chapitres/'; // iOS Simulator
    } else {
      return 'http://localhost:8000/api/chapitres/'; // Fallback
    }
  }


  // méthode existante fetchThemes()

  static Future<List<ChapitreModel>> fetchChapitresByTheme(int themeId) async {
    String apiUrl;
    if (Platform.isAndroid) {
       apiUrl = 'http://10.0.2.2:8000/api/themes/$themeId/chapitres/'; // Émulateur Android
    } else if (Platform.isIOS) {
      apiUrl = 'http://localhost:8000/api/themes/$themeId/chapitres/'; // iOS Simulator
    } else {
      apiUrl = 'http://localhost:8000/api/themes/$themeId/chapitres/'; // Fallback
    }
  final response = await http.get(

    Uri.parse('http://10.0.2.2:8000/api/themes/$themeId/chapitres/'),
  );

  if (response.statusCode == 200) {
    final decoded = jsonDecode(response.body);

    //   On récupère la liste depuis "results"
    final List<dynamic> results = decoded['results'] ?? [];

    return results.map((e) => ChapitreModel.fromJson(e)).toList();
  } else {
    throw Exception('Erreur de chargement des chapitres (${response.statusCode})');
  }
}

}