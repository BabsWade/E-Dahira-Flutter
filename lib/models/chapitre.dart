import 'sequence_model.dart';

class ChapitreModel {
  final String chapitre;
  final SequenceModel sequence;

  ChapitreModel({required this.chapitre, required this.sequence});

  factory ChapitreModel.fromJson(Map<String, dynamic> json) {
    return ChapitreModel(
      chapitre: json['nom_chapitre'] ?? '',
      sequence: SequenceModel.fromJson(json['sequence']),
    );
  }

  Map<String, dynamic> toJson() => {
        'nom_chapitre': chapitre,
        'sequence': sequence.toJson(),
      };
}