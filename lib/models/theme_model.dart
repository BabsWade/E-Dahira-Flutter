import 'chapitre_model.dart';

class ThemeModel {
  final String theme;
  final ChapitreModel chapitre;

  ThemeModel({
    required this.theme,
    required this.chapitre,
  });

  factory ThemeModel.fromJson(Map<String, dynamic> json) {
    return ThemeModel(
      theme: json['nom_theme'],
      chapitre: ChapitreModel.fromJson(json['chapitre']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nom_theme': theme,
      'chapitre': chapitre.toJson(),
    };
  }
}
