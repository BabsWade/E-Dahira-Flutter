class Auteur {
  final int id; // ✅ Ajout
  final String firstName;
  final String lastName;

  Auteur({
    required this.id, // ✅ Ajout
    required this.firstName,
    required this.lastName,
  });

  factory Auteur.fromJson(Map<String, dynamic> json) {
    return Auteur(
      id: json['id'] ?? 0, // ✅ Ajout
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id, // ✅ Ajout
      'first_name': firstName,
      'last_name': lastName,
    };
  }

  String get fullName => '$firstName $lastName';
}


