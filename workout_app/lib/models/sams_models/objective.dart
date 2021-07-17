class Objective {
  int id;
  String name;
  String image;

  Objective(this.id, this.name, this.image);

  Objective.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        image = json['image'];
}
