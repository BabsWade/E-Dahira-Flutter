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
static Future<List<AudioModel>> fetchAudios() async {
  try {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      final results = data['results'];

      if (results == null) {
        throw Exception("Réponse API invalide : 'results' est null.");
      }
      if (results is! List) {
        throw Exception("Le champ 'results' n'est pas une liste.");
      }

      return results.map((e) => AudioModel.fromJson(e)).toList();
    } else {
      throw Exception('Échec du chargement (${response.statusCode})');
    }
  } catch (e) {
    print("Erreur fetchAudios : $e");
    rethrow;
  }
}

}