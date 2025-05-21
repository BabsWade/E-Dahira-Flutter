import '../models/audio_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io' show Platform;

class AudioService {
  static String get apiUrl {
    if (Platform.isAndroid) {
      return 'http://10.0.2.2:8000/api/audio/'; // émulateur Android
    } else if (Platform.isIOS) {
      return 'http://192.168.1.6:8000/api/audio/'; // Ton IP locale pour iOS Simulator
    } else {
      return 'http://localhost:8000/api/audio/'; // fallback
    }
  }
  static Future<List<AudioModel>> fetchAudios() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> results = data['results'];
      return results.map((json) => AudioModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch audios');
    }
  }
}