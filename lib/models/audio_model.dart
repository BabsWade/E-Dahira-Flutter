
import 'package:flutter/foundation.dart';

import 'membre_model.dart';

class AudioModel {
  final String theme ;
  final String chapitre;
  final String sequence;
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
      chapitre: json['chapitre'],
      sequence: json['sequence'],
      audioFile: json['audioFile'],
      audioImage: json['audioImage'],
      audioDate: DateTime.parse(json['audioDate']),
      auteur: MembreModel(
        prenom: json['auteur']['prenom'],
        nom: json['auteur']['nom'],
        telephone: json['auteur']['telephone'],
        email: json['auteur']['email'],
        ImageUrl: json['auteur']['ImageUrl'],
        adresse: json['auteur']['adresse'],
        role: json['auteur']['role'],
        dahira: json['auteur']['dahira'],
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'theme': theme,
      'chapitre': chapitre,
      'sequence': sequence,
      'audioFile': audioFile,
      'audioImage': audioImage,
      'audioDate': audioDate.toIso8601String(),
      'auteur': auteur.toJson(),
    };
  }
}