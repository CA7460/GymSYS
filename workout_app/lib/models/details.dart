class Details {
  int _id;
  int _exerciceID;
  String _longDescription;
  String _muscles;
  String _execution;
  String _youtubeLink;

  Details(this._id, this._exerciceID, this._longDescription, this._muscles,
      this._execution, this._youtubeLink);

  // Getters & Setters
  int get id => _id;
  int get exerciceID => _exerciceID;
  String get longDescription => _longDescription;
  String get muscles => _muscles;
  String get execution => _execution;
  String get youtubeLink => _youtubeLink;

  set id(int id) {
    _id = id;
  }

  set exerciceID(int exerciceID) {
    _exerciceID = exerciceID;
  }

  set longDescription(String longDescription) {
    _longDescription = longDescription;
  }

  set muscles(String muscles) {
    // check for muscles.length
    _muscles = muscles;
  }

  set execution(String execution) {
    _execution = execution;
  }

  set youtubeLink(String youtubeLink) {
    _youtubeLink = youtubeLink;
  }

  //Other Constructors
  Details.fromJson(Map<String, dynamic> json)
      : _id = json['id'],
        _exerciceID = json['exerciceID'],
        _longDescription = json['longDescription'],
        _muscles = json['muscles'],
        _execution = json['execution'],
        _youtubeLink = json['youtubeLink'];

  Details.fromMapToObject(Map<String, dynamic> map)
      : _id = map['id'],
        _exerciceID = map['exerciceID'],
        _longDescription = map['longDescription'],
        _muscles = map['muscles'],
        _execution = map['execution'],
        _youtubeLink = map['youtubeLink'];

  // Mapping
  Map<String, dynamic> fromObjectToMap() {
    var map = Map<String, dynamic>();
    if (_id != null) {
      map['id'] = _id;
    } 
    if (_id == 0) {
      map['id'] = null;
    }

    map['exerciceID'] = _exerciceID;
    map['longDescription'] = _longDescription;
    map['muscles'] = _muscles;
    map['execution'] = _execution;
    map['youtubeLink'] = _youtubeLink;
    return map;
  }
}
