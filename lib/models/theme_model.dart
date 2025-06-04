class ThemeModel {
  final int id;
  final String nomTheme;

  ThemeModel({required this.id, required this.nomTheme});

  factory ThemeModel.fromJson(Map<String, dynamic> json) {
    return ThemeModel(
      id: json['id'] ?? 0,
      nomTheme: json['nom_theme'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'nom_theme': nomTheme,
      };
}
