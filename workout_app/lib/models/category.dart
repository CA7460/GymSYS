import 'dart:core';

class Category {
  final int id;
  final String name;
  final String image;
  final List<int> objectives;

  const Category({ required this.id, required this.name, required this.image, required this.objectives });

  factory Category.fromJson(Map<String, dynamic> json) {
    return new Objective(id: json['id'] as int, name: json['name'] as String, image: json['image'] as String, objectives: json['objectives'] as List<int>);
  }
}