class Actor {
  final String id;
  final String name;
  final String image;

  Actor({required this.id, required this.name, required this.image});

  Actor copyWith({
    String? id,
    String? name,
    String? image,
  }) {
    return Actor(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
    );
  }

  factory Actor.fromJson(
    Map<String, dynamic> json,
  ) {
    return Actor(
      id: json['id'].toString(),
      name: json['name'],
      image: json['profile_path'] ?? '',
    );
  }
}
