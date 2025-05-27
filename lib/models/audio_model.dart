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
  final ThemeModel theme;

  AudioModel({
    required this.audioName,
    required this.audioFile,
    required this.audioImage,
    required this.audioDate,
    required this.auteur,
    required this.chapitre,
    required this.sequence,
    required this.theme,
  });

  factory AudioModel.fromJson(Map<String, dynamic> json) {
    return AudioModel(
      audioName: json['nom_audio'],
      audioFile: json['audio_file'],
      audioImage: json['image_audio'], // correction ici
      audioDate: DateTime.parse(json['date_audio']),
      auteur: MembreModel.fromJson(json['auteur']), // passer par fromJson de MembreModel
      chapitre: ChapitreModel.fromJson(json['chapitre']),
      sequence: SequenceModel.fromJson(json['sequence']),
      theme: ThemeModel.fromJson(json['theme']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'theme': theme.toJson(),
      'chapitre': chapitre.toJson(),
      'sequence': sequence.toJson(),
      'audio_file': audioFile,
      'image_audio': audioImage,
      'date_audio': audioDate.toIso8601String(),
      'auteur': auteur.toJson(),
      'nom_audio': audioName,
    };
  }
}