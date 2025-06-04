import '../models/audio_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io' show Platform;

class AudioService {
  static String get apiUrl {
    if (Platform.isAndroid) {
      return 'http://10.0.2.2:8000/api/audios/'; // Émulateur Android
    } else if (Platform.isIOS) {
      return 'http://localhost:8000/api/audios/'; // iOS Simulator
    } else {
      return 'http://localhost:8000/api/audios/'; // Fallback
    }
  }

  /// Méthode générique qui prend les filtres optionnels
  static Future<List<AudioModel>> fetchAudios({
    int? chapitreId,
    String? theme,
    int? auteurId,
  }) async {
    final queryParams = <String>[];
    if (chapitreId != null) queryParams.add('chapitre=$chapitreId');
    if (theme != null && theme.isNotEmpty) queryParams.add('theme=$theme');
    if (auteurId != null) queryParams.add('auteur=$auteurId');

    final url = Uri.parse(
      queryParams.isEmpty ? apiUrl : '$apiUrl?${queryParams.join('&')}',
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      final results = data['results'];
      if (results == null || results is! List) {
        throw Exception("Le champ 'results' est invalide.");
      }
      return results.map<AudioModel>((e) => AudioModel.fromJson(e)).toList();
    } else {
      throw Exception('Erreur API : ${response.statusCode}');
    }
  }
}
