class Gender {
  final String id;
  final String name;

  Gender({
    required this.id,
    required this.name,
  });

  Gender copyWith({
    String? id,
    String? name,
  }) {
    return Gender(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  factory Gender.fromJson(
    Map<String, dynamic> json,
  ) {
    return Gender(
      id: json['id'].toString(),
      name: json['name'],
    );
  }
}
