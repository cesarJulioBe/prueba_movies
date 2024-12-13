class Company {
  final String id;
  final String name;

  Company({
    required this.id,
    required this.name,
  });

  Company copyWith({
    String? id,
    String? name,
  }) {
    return Company(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  factory Company.fromJson(
    Map<String, dynamic> json,
  ) {
    return Company(
      id: json['id'].toString(),
      name: json['name'],
    );
  }
}
