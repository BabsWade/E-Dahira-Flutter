import '../models/audio_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io' show Platform;

class AudioService {
  static String get apiUrl {
    if (Platform.isAndroid) {
      return 'http://10.0.2.2:8000/api/audios/'; // émulateur Android
    } else if (Platform.isIOS) {
      return 'http://localhost:8000/api/audios/'; // Ton IP locale pour iOS Simulator
    } else {
      return 'http://localhost:8000/api/audios/'; // fallback
    }
  }
  static Future<List<AudioModel>> fetchAudiosByChapitreThemeAuteur({
  required int chapitreId,
  required String theme,
  required int auteurId,
}) async {
  final url = Uri.parse(
    '$apiUrl?chapitre=$chapitreId&theme=$theme&auteur=$auteurId',
  );

  final response = await http.get(url);

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    final results = data['results'];
    return (results as List).map((e) => AudioModel.fromJson(e)).toList();
  } else {
    throw Exception('Erreur lors du chargement des audios');
  }
}

static Future<List<AudioModel>> fetchAudios({
  required int chapitreId,
  required String theme,
  required int auteurId,
}) async {
  try {
    final uri = Uri.parse(
      '$apiUrl?chapitre=$chapitreId&theme=$theme&auteur=$auteurId',
    );

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      final results = data['results'];

      if (results == null || results is! List) {
        throw Exception("Le champ 'results' est invalide.");
      }

      return results.map((e) => AudioModel.fromJson(e)).toList();
    } else {
      throw Exception('Erreur API : ${response.statusCode}');
    }
  } catch (e) {
    print("Erreur fetchAudios : $e");
    rethrow;
  }
}


}