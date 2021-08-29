class Exercice {
  int _id;
  String _name;
  String _image;
  String _description;
  // List<int> _categories;
  String _categories;

  Exercice(
      this._id, this._name, this._image, this._description, this._categories);

  // Getters & Setters
  int get id => _id;
  String get name => _name;
  String get image => _image;
  String get description => _description;
  // List<int> get categories => _categories;
  String get categories => _categories;

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

  set description(String description) {
    _description = description;
  }

  // set categories(List<int> categories) {
  //   _categories = categories;
  // }

  set categories(String categories) {
    _categories = categories;
  }

  //Other Constructors
  Exercice.fromJson(Map<String, dynamic> json)
      : _id = json['id'],
        _name = json['name'],
        _image = json['image'],
        _description = json['description'],
        // _categories = List<int>.from(json['categories']);
        _categories = json['categories'];

  Exercice.fromMapToObject(Map<String, dynamic> map)
      : _id = map['id'],
        _name = map['name'],
        _image = map['image'],
        _description = map['description'],
        _categories = map['categories'];

  // Mapping
  Map<String, dynamic> fromObjectToMap() {
    var map = Map<String, dynamic>();
    if (_id != null) {
      map['id'] = _id;
    }
    if (_id == 0) {
      map['id'] = null;
      print('ok next moove tu va lavoir');
    }
    map['name'] = _name;
    map['image'] = _image;
    map['description'] = _description;
    map['categories'] = _categories;
    return map;
  }
}
