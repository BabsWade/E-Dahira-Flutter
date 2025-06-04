import 'auteur.dart';
import 'theme_model.dart';

class ChapitreModel {
  final int id;
  final String nomChapitre;
  final Auteur? auteur;
  final ThemeModel? theme;

  ChapitreModel({
    required this.id,
    required this.nomChapitre,
    this.auteur,
    this.theme,
  });

  factory ChapitreModel.fromJson(Map<String, dynamic> json) {
    return ChapitreModel(
      id: json['id'] ?? 0,
      nomChapitre: json['nom_chapitre'] ?? '',
      auteur: json['auteur'] != null ? Auteur.fromJson(json['auteur']) : null,
      theme: json['theme'] != null ? ThemeModel.fromJson(json['theme']) : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'nom_chapitre': nomChapitre,
        if (auteur != null) 'auteur': auteur!.toJson(),
        if (theme != null) 'theme': theme!.toJson(),
      };
}