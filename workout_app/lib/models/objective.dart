class Objective {
  int _id;
  String _name;
  String _image;

  Objective(this._id, this._name, this._image);

  // Getters & Setters
  int get id => _id;
  String get name => _name;
  String get image => _image;

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

  //Other Constructors
  Objective.fromJson(Map<String, dynamic> json)
      : _id = json['id'],
        _name = json['name'],
        _image = json['image'];

  Objective.fromMapToObject(Map<String, dynamic> map)
      : _id = map['id'],
        _name = map['name'],
        _image = map['image'];

  // Mapping
  Map<String, dynamic> fromObjectToMap() {
    var map = Map<String, dynamic>();
    if (_id != null) {
      map['id'] = _id;
    }
    map['name'] = _name;
    map['image'] = _image;
    return map;
  }
}
