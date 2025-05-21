import 'package:edahira/models/dahira_model.dart';

class MembreModel {
  final String prenom;
  final String nom;
  final String telephone;
  final String email;
  final String? imageUrl;
  final String? adresse;
  final String role;
  final DahiraModel? dahira;

  MembreModel({
    required this.prenom,
    required this.nom,
    required this.telephone,
    required this.email,
    this.imageUrl,
    this.adresse,
    required this.role,
    this.dahira,
  });

  factory MembreModel.fromJson(Map<String, dynamic> json) {
    return MembreModel(
      prenom: json['first_name'],
      nom: json['last_name'],
      telephone: json['telephone'],
      email: json['email'],
      imageUrl: json['photo'],
      adresse: json['adresse'], // si tu as ce champ
      role: json['role'],
      dahira: json['dahira'] != null ? DahiraModel.fromJson(json['dahira']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'first_name': prenom,
      'last_name': nom,
      'telephone': telephone,
      'email': email,
      'photo': imageUrl,
      'adresse': adresse,
      'role': role,
      'dahira': dahira?.toJson(),
    };
  }
}