/// id : 1
/// name : "Sandwich"
/// parent_id : 0
/// position : 0
/// status : 1
/// created_at : "2022-10-01T08:36:51.000000Z"
/// updated_at : "2022-10-01T08:36:51.000000Z"
/// image : "2022-10-01-6337fc23d9b4e.png"
/// banner_image : "2022-10-01-6337fc23db195.png"
/// translations : []

class CategoryModel {
  CategoryModel({
      num? id, 
      String? name, 
      num? parentId, 
      num? position, 
      num? status, 
      String? createdAt, 
      String? updatedAt, 
      String? image, 
      String? bannerImage, 
      List<dynamic>? translations,}){
    _id = id;
    _name = name;
    _parentId = parentId;
    _position = position;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _image = image;
    _bannerImage = bannerImage;
    //_translations = translations;
}

  CategoryModel.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _parentId = json['parent_id'];
    _position = json['position'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _image = json['image'];
    _bannerImage = json['banner_image'];
    // if (json['translations'] != null) {
    //   _translations = [];
    //   json['translations'].forEach((v) {
    //     _translations?.add(Dynamic.fromJson(v));
    //   });
    // }
  }
  num? _id;
  String? _name;
  num? _parentId;
  num? _position;
  num? _status;
  String? _createdAt;
  String? _updatedAt;
  String? _image;
  String? _bannerImage;
CategoryModel copyWith({  num? id,
  String? name,
  num? parentId,
  num? position,
  num? status,
  String? createdAt,
  String? updatedAt,
  String? image,
  String? bannerImage,
  List<dynamic>? translations,
}) => CategoryModel(  id: id ?? _id,
  name: name ?? _name,
  parentId: parentId ?? _parentId,
  position: position ?? _position,
  status: status ?? _status,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  image: image ?? _image,
  bannerImage: bannerImage ?? _bannerImage,
  //translations: translations ?? _translations,
);
  num? get id => _id;
  String? get name => _name;
  num? get parentId => _parentId;
  num? get position => _position;
  num? get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get image => _image;
  String? get bannerImage => _bannerImage;
  //List<dynamic>? get translations => _translations;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['parent_id'] = _parentId;
    map['position'] = _position;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['image'] = _image;
    map['banner_image'] = _bannerImage;
    // if (_translations != null) {
    //   map['translations'] = _translations?.map((v) => v.toJson()).toList();
    // }
    return map;
  }

}