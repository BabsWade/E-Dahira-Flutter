class SequenceModel {
  final String sequence;

  SequenceModel({required this.sequence});

  factory SequenceModel.fromJson(dynamic json) {
    if (json is Map<String, dynamic>) {
      return SequenceModel(sequence: json['nom_sequence'] ?? '');
    } else if (json is String) {
      return SequenceModel(sequence: json);
    } else {
      return SequenceModel(sequence: '');
    }
  }

  Map<String, dynamic> toJson() => {
        'nom_sequence': sequence,
      };
}
