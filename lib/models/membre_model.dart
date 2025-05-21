import 'package:edahira/models/dahira_model.dart';

class MembreModel{
  final String prenom;
  final String nom;
  final String telephone;
  final String email;
  final String adresse;
  final String ImageUrl;
  final String role;
  final DahiraModel dahira;

  MembreModel({
    required this.prenom,
    required this.nom,
    required this.telephone,
    required this.email,
    required this.adresse,
    required this.ImageUrl,
    required this.role,
    required this.dahira,
  });

  factory MembreModel.fromJson(Map<String, dynamic> json) {
    return MembreModel(
      prenom: json['prenom'],
      nom: json['nom'],
      telephone: json['telephone'],
      email: json['email'],
      adresse: json['adresse'],
      ImageUrl: json['ImageUrl'],
      role: json['role'],
      dahira: DahiraModel(
        nomDahira: json['dahira']['nomDahira'],
        siege: json['dahira']['siege'],
        logoUrl: json['dahira']['logoUrl'],
        dateCreation: DateTime.parse(json['dahira']['dateCreation']),
        description: json['dahira']['description'],
      ),
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'prenom': prenom,
      'nom': nom,
      'telephone': telephone,
      'email': email,
      'adresse': adresse,
      'ImageUrl': ImageUrl,
      'role': role,
    };
  }
}