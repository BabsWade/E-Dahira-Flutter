class DahiraModel{
  final String nomDahira;
  final String siege;
  final String logoUrl;
  final DateTime dateCreation;
  final String description;

  DahiraModel({
    required this.nomDahira,
    required this.siege,
    required this.logoUrl,
    required this.dateCreation,
    required this.description,
  });

  factory DahiraModel.fromJson(Map<String, dynamic> json) {
    return DahiraModel(
      nomDahira: json['nom_dahira'],
      siege: json['siege'],
      logoUrl: json['logo'],
      dateCreation: DateTime.parse(json['date_creation']),
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nom_dahira': nomDahira,
      'siege': siege,
      'logo': logoUrl,
      'date_creation': dateCreation.toIso8601String(),
      'description': description,
    };
  }
}