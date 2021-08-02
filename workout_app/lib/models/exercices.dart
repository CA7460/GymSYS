class Exercice {
  int id;
  String name;
  String image;
  String description;
  List<dynamic> categories;

  Exercice(this.id, this.name, this.image, this.description, this.categories);

  Exercice.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        image = json ['image'],
        description = json['description'],
        categories = json['categories'];
}