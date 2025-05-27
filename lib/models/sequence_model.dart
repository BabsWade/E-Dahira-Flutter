class SequenceModel{
  final String sequence;

  SequenceModel({
    required this.sequence,
  });

  factory SequenceModel.fromJson(Map<String, dynamic> json) {
    return SequenceModel(
      sequence: json['nom_sequence'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nom_sequence': sequence,
    };
  }

}