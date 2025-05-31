// models/chapitre.dart
class ChapitreModel {
  final int id;
  final String nomChapitre;

  ChapitreModel({required this.id, required this.nomChapitre});

  factory ChapitreModel.fromJson(Map<String, dynamic> json) {
    return ChapitreModel(
      id: json['id'],
      nomChapitre: json['nom_chapitre'],
    );
  }
}
