class Categorie {
  int id;
  String name;
  String image;
  List<dynamic> objectives;

  Categorie(this.id, this.name, this.image, this.objectives);

  Categorie.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      name = json['name'],
      image = json['image'],
      objectives = json['objectives'];
}