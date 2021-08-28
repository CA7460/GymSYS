// import 'dart:ffi';

class Categorie {
  int _id;
  String _name;
  String _image;
  List<dynamic> _objectives;

  Categorie(this._id, this._name, this._image, this._objectives);

  // Getters & Setters
  int get id => _id;
  String get name => _name;
  String get image => _image;
  List<dynamic> get objectives => _objectives;

  // Getters & Setters
  set id(int id) {
    _id = id;
  }

  set name(String name) {
    if (name.length <= 20) {
      _name = name;
    }
  }

  set image(String image) {
    // if...vérifier validité du path
    _image = image;
  }

  set objectives(List<dynamic> objectives) {
    _objectives = objectives;
  }

  // Other constructors
  Categorie.fromJson(Map<String, dynamic> json)
      : _id = json['id'],
        _name = json['name'],
        _image = json['image'],
        _objectives = json['objectives'];

  Categorie.fromMapToObject(Map<String, dynamic> map)
      : _id = map['id'],
        _name = map['name'],
        _image = map['image'],
        _objectives = map['objectives'];

  // Mapping
  Map<String, dynamic> fromObjectToMap() {
    var map = Map<String, dynamic>();
    if (_id != null) {
      map['id'] = _id;
    }
    map['name'] = _name;
    map['image'] = _image;
    map['objectives'] = _objectives;
    return map;
  }
}
