// services/api_service.dart (ajoute cette méthode)
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/chapitre.dart';

class ChapitreService {
  static const String baseUrl = 'http://10.0.2.2:8000/api/chapitres/';

  // méthode existante fetchThemes()

  static Future<List<ChapitreModel>> fetchChapitresByTheme(int themeId) async {
  final response = await http.get(
    Uri.parse('http://10.0.2.2:8000/api/themes/$themeId/chapitres/'),
  );

  if (response.statusCode == 200) {
    final decoded = jsonDecode(response.body);

    // ✅ On récupère la liste depuis "results"
    final List<dynamic> results = decoded['results'] ?? [];

    return results.map((e) => ChapitreModel.fromJson(e)).toList();
  } else {
    throw Exception('Erreur de chargement des chapitres (${response.statusCode})');
  }
}

}
