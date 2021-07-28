class Exercices {
  final String id;
  final String name;
  final String image;

  Exercices(this.id, this.name, this.image);

  Exercices.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        image = json['image'];

  Map<String, dynamic> toJson() =>
      {'id': id, 'name': name, 'image': image};
}