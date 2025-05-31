import 'package:edahira/models/sequence_model.dart';
import 'package:edahira/models/theme_model.dart';
import 'chapitre_model.dart';
import 'membre_model.dart';

class AudioModel {
  final String audioName;
  final String audioFile;
  final String audioImage;
  final DateTime audioDate;
  final MembreModel auteur;
  final ChapitreModel chapitre;
  final SequenceModel sequence;

  AudioModel({
    required this.audioName,
    required this.audioFile,
    required this.audioImage,
    required this.audioDate,
    required this.auteur,
    required this.chapitre,
    required this.sequence,
  });

  factory AudioModel.fromJson(Map<String, dynamic> json) {
    return AudioModel(
      audioName: json['nom_audio'] ?? '',
      audioFile: json['audio_file'] ?? '',
      audioImage: json['image_audio'] ?? '',
      audioDate: DateTime.tryParse(json['date_audio'] ?? '') ?? DateTime.now(),
      auteur: MembreModel.fromJson(json['auteur']),
      chapitre: ChapitreModel.fromJson(json['chapitre']),
      sequence: SequenceModel.fromJson(json['sequence']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nom_audio': audioName,
      'audio_file': audioFile,
      'image_audio': audioImage,
      'date_audio': audioDate.toIso8601String(),
      'auteur': auteur.toJson(),
      'chapitre': chapitre.toJson(),
      'sequence': sequence.toJson(),
    };
  }
}
