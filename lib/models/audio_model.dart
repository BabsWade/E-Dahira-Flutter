
import 'package:flutter/foundation.dart';

import 'membre_model.dart';

class AudioModel {
  final String theme;
  final String? chapitre;
  final String? sequence;
  final String audioFile;
  final String audioImage;
  final DateTime audioDate;
  final MembreModel auteur;

  AudioModel({
    required this.theme,
    required this.chapitre,
    required this.sequence,
    required this.audioFile,
    required this.audioImage,
    required this.audioDate,
    required this.auteur,
  });

  factory AudioModel.fromJson(Map<String, dynamic> json) {
    return AudioModel(
      theme: json['theme'],
      chapitre: json['chapitre'] ?? 'Sans Chapitre',
      sequence: json['sequence'] ?? 'Sans sequence',
      audioFile: json['audio_file'],
      audioImage: json['image_audio'], // correction ici
      audioDate: DateTime.parse(json['date_audio']),
      auteur: MembreModel.fromJson(json['auteur']), // passer par fromJson de MembreModel
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'theme': theme,
      'chapitre': chapitre,
      'sequence': sequence,
      'audio_file': audioFile,
      'image_audio': audioImage,
      'date_audio': audioDate.toIso8601String(),
      'auteur': auteur.toJson(),
    };
  }
}