class Objective {
  final int id;
  final String name;
  final String image;

  const Objective({ required this.id, required this.name, required this.image });

  factory Objective.fromJson(Map<String, dynamic> json) {
    return new Objective(id: json['id'] as int, name: json['name'] as String, image: json['image'] as String);
  }
}