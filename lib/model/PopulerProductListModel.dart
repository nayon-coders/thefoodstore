/// total_size : 2
/// limit : null
/// offset : null
/// products : [{"id":1,"name":"new sand","description":"test","image":"2022-10-01-6337fcb79cd8a.png","price":100,"variations":[],"add_ons":[{"id":1,"name":"test","price":100,"created_at":"2022-10-01T08:38:01.000000Z","updated_at":"2022-10-01T08:38:01.000000Z","translations":[]}],"tax":0,"available_time_starts":"10:30:00","available_time_ends":"19:30:00","status":1,"created_at":"2022-10-01T08:39:19.000000Z","updated_at":"2022-10-18T06:27:45.000000Z","attributes":[],"category_ids":[{"id":"1","position":1},{"id":"2","position":2}],"choice_options":[],"discount":0,"discount_type":"percent","tax_type":"percent","set_menu":0,"branch_id":1,"colors":null,"popularity_count":1,"rating":[]},{"id":2,"name":"burger","description":"burger","image":"2022-10-18-634e4674d0cec.png","price":100,"variations":[],"add_ons":[{"id":1,"name":"test","price":100,"created_at":"2022-10-01T08:38:01.000000Z","updated_at":"2022-10-01T08:38:01.000000Z","translations":[]}],"tax":0,"available_time_starts":"00:00:00","available_time_ends":"23:59:00","status":1,"created_at":"2022-10-18T06:23:48.000000Z","updated_at":"2022-10-18T06:27:45.000000Z","attributes":[],"category_ids":[{"id":"1","position":1},{"id":"2","position":2}],"choice_options":[],"discount":0,"discount_type":"percent","tax_type":"percent","set_menu":0,"branch_id":1,"colors":null,"popularity_count":1,"rating":[]}]

class PopulerProductListModel {
  PopulerProductListModel({
      num? totalSize, 
      dynamic limit, 
      dynamic offset, 
      List<Products>? products,}){
    _totalSize = totalSize;
    _limit = limit;
    _offset = offset;
    _products = products;
}

  PopulerProductListModel.fromJson(dynamic json) {
    _totalSize = json['total_size'];
    _limit = json['limit'];
    _offset = json['offset'];
    if (json['products'] != null) {
      _products = [];
      json['products'].forEach((v) {
        _products?.add(Products.fromJson(v));
      });
    }
  }
  num? _totalSize;
  dynamic _limit;
  dynamic _offset;
  List<Products>? _products;
PopulerProductListModel copyWith({  num? totalSize,
  dynamic limit,
  dynamic offset,
  List<Products>? products,
}) => PopulerProductListModel(  totalSize: totalSize ?? _totalSize,
  limit: limit ?? _limit,
  offset: offset ?? _offset,
  products: products ?? _products,
);
  num? get totalSize => _totalSize;
  dynamic get limit => _limit;
  dynamic get offset => _offset;
  List<Products>? get products => _products;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total_size'] = _totalSize;
    map['limit'] = _limit;
    map['offset'] = _offset;
    if (_products != null) {
      map['products'] = _products?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// name : "new sand"
/// description : "test"
/// image : "2022-10-01-6337fcb79cd8a.png"
/// price : 100
/// variations : []
/// add_ons : [{"id":1,"name":"test","price":100,"created_at":"2022-10-01T08:38:01.000000Z","updated_at":"2022-10-01T08:38:01.000000Z","translations":[]}]
/// tax : 0
/// available_time_starts : "10:30:00"
/// available_time_ends : "19:30:00"
/// status : 1
/// created_at : "2022-10-01T08:39:19.000000Z"
/// updated_at : "2022-10-18T06:27:45.000000Z"
/// attributes : []
/// category_ids : [{"id":"1","position":1},{"id":"2","position":2}]
/// choice_options : []
/// discount : 0
/// discount_type : "percent"
/// tax_type : "percent"
/// set_menu : 0
/// branch_id : 1
/// colors : null
/// popularity_count : 1
/// rating : []

class Products {
  Products({
      num? id, 
      String? name, 
      String? description, 
      String? image, 
      num? price, 
      List<dynamic>? variations, 
      List<AddOns>? addOns, 
      num? tax, 
      String? availableTimeStarts, 
      String? availableTimeEnds, 
      num? status, 
      String? createdAt, 
      String? updatedAt, 
      List<dynamic>? attributes, 
      List<CategoryIds>? categoryIds, 
      List<dynamic>? choiceOptions, 
      num? discount, 
      String? discountType, 
      String? taxType, 
      num? setMenu, 
      num? branchId, 
      dynamic colors, 
      num? popularityCount, 
      List<dynamic>? rating,}){
    _id = id;
    _name = name;
    _description = description;
    _image = image;
    _price = price;
    _variations = variations;
    _addOns = addOns;
    _tax = tax;
    _availableTimeStarts = availableTimeStarts;
    _availableTimeEnds = availableTimeEnds;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _attributes = attributes;
    _categoryIds = categoryIds;
    _choiceOptions = choiceOptions;
    _discount = discount;
    _discountType = discountType;
    _taxType = taxType;
    _setMenu = setMenu;
    _branchId = branchId;
    _colors = colors;
    _popularityCount = popularityCount;
    _rating = rating;
}

  Products.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _description = json['description'];
    _image = json['image'];
    _price = json['price'];
    if (json['variations'] != null) {
      _variations = [];
      json['variations'].forEach((v) {
        _variations?.add(json.fromJson(v));
      });
    }
    if (json['add_ons'] != null) {
      _addOns = [];
      json['add_ons'].forEach((v) {
        _addOns?.add(AddOns.fromJson(v));
      });
    }
    _tax = json['tax'];
    _availableTimeStarts = json['available_time_starts'];
    _availableTimeEnds = json['available_time_ends'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    if (json['attributes'] != null) {
      _attributes = [];
      json['attributes'].forEach((v) {
        _attributes?.add(json.fromJson(v));
      });
    }
    if (json['category_ids'] != null) {
      _categoryIds = [];
      json['category_ids'].forEach((v) {
        _categoryIds?.add(CategoryIds.fromJson(v));
      });
    }
    if (json['choice_options'] != null) {
      _choiceOptions = [];
      json['choice_options'].forEach((v) {
        _choiceOptions?.add(json.fromJson(v));
      });
    }
    _discount = json['discount'];
    _discountType = json['discount_type'];
    _taxType = json['tax_type'];
    _setMenu = json['set_menu'];
    _branchId = json['branch_id'];
    _colors = json['colors'];
    _popularityCount = json['popularity_count'];
    if (json['rating'] != null) {
      _rating = [];
      json['rating'].forEach((v) {
        _rating?.add(json.fromJson(v));
      });
    }
  }
  num? _id;
  String? _name;
  String? _description;
  String? _image;
  num? _price;
  List<dynamic>? _variations;
  List<AddOns>? _addOns;
  num? _tax;
  String? _availableTimeStarts;
  String? _availableTimeEnds;
  num? _status;
  String? _createdAt;
  String? _updatedAt;
  List<dynamic>? _attributes;
  List<CategoryIds>? _categoryIds;
  List<dynamic>? _choiceOptions;
  num? _discount;
  String? _discountType;
  String? _taxType;
  num? _setMenu;
  num? _branchId;
  dynamic _colors;
  num? _popularityCount;
  List<dynamic>? _rating;
Products copyWith({  num? id,
  String? name,
  String? description,
  String? image,
  num? price,
  List<dynamic>? variations,
  List<AddOns>? addOns,
  num? tax,
  String? availableTimeStarts,
  String? availableTimeEnds,
  num? status,
  String? createdAt,
  String? updatedAt,
  List<dynamic>? attributes,
  List<CategoryIds>? categoryIds,
  List<dynamic>? choiceOptions,
  num? discount,
  String? discountType,
  String? taxType,
  num? setMenu,
  num? branchId,
  dynamic colors,
  num? popularityCount,
  List<dynamic>? rating,
}) => Products(  id: id ?? _id,
  name: name ?? _name,
  description: description ?? _description,
  image: image ?? _image,
  price: price ?? _price,
  variations: variations ?? _variations,
  addOns: addOns ?? _addOns,
  tax: tax ?? _tax,
  availableTimeStarts: availableTimeStarts ?? _availableTimeStarts,
  availableTimeEnds: availableTimeEnds ?? _availableTimeEnds,
  status: status ?? _status,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  attributes: attributes ?? _attributes,
  categoryIds: categoryIds ?? _categoryIds,
  choiceOptions: choiceOptions ?? _choiceOptions,
  discount: discount ?? _discount,
  discountType: discountType ?? _discountType,
  taxType: taxType ?? _taxType,
  setMenu: setMenu ?? _setMenu,
  branchId: branchId ?? _branchId,
  colors: colors ?? _colors,
  popularityCount: popularityCount ?? _popularityCount,
  rating: rating ?? _rating,
);
  num? get id => _id;
  String? get name => _name;
  String? get description => _description;
  String? get image => _image;
  num? get price => _price;
  List<dynamic>? get variations => _variations;
  List<AddOns>? get addOns => _addOns;
  num? get tax => _tax;
  String? get availableTimeStarts => _availableTimeStarts;
  String? get availableTimeEnds => _availableTimeEnds;
  num? get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  List<dynamic>? get attributes => _attributes;
  List<CategoryIds>? get categoryIds => _categoryIds;
  List<dynamic>? get choiceOptions => _choiceOptions;
  num? get discount => _discount;
  String? get discountType => _discountType;
  String? get taxType => _taxType;
  num? get setMenu => _setMenu;
  num? get branchId => _branchId;
  dynamic get colors => _colors;
  num? get popularityCount => _popularityCount;
  List<dynamic>? get rating => _rating;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['description'] = _description;
    map['image'] = _image;
    map['price'] = _price;
    if (_variations != null) {
      map['variations'] = _variations?.map((v) => v.toJson()).toList();
    }
    if (_addOns != null) {
      map['add_ons'] = _addOns?.map((v) => v.toJson()).toList();
    }
    map['tax'] = _tax;
    map['available_time_starts'] = _availableTimeStarts;
    map['available_time_ends'] = _availableTimeEnds;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_attributes != null) {
      map['attributes'] = _attributes?.map((v) => v.toJson()).toList();
    }
    if (_categoryIds != null) {
      map['category_ids'] = _categoryIds?.map((v) => v.toJson()).toList();
    }
    if (_choiceOptions != null) {
      map['choice_options'] = _choiceOptions?.map((v) => v.toJson()).toList();
    }
    map['discount'] = _discount;
    map['discount_type'] = _discountType;
    map['tax_type'] = _taxType;
    map['set_menu'] = _setMenu;
    map['branch_id'] = _branchId;
    map['colors'] = _colors;
    map['popularity_count'] = _popularityCount;
    if (_rating != null) {
      map['rating'] = _rating?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : "1"
/// position : 1

class CategoryIds {
  CategoryIds({
      String? id, 
      num? position,}){
    _id = id;
    _position = position;
}

  CategoryIds.fromJson(dynamic json) {
    _id = json['id'];
    _position = json['position'];
  }
  String? _id;
  num? _position;
CategoryIds copyWith({  String? id,
  num? position,
}) => CategoryIds(  id: id ?? _id,
  position: position ?? _position,
);
  String? get id => _id;
  num? get position => _position;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['position'] = _position;
    return map;
  }

}

/// id : 1
/// name : "test"
/// price : 100
/// created_at : "2022-10-01T08:38:01.000000Z"
/// updated_at : "2022-10-01T08:38:01.000000Z"
/// translations : []

class AddOns {
  AddOns({
      num? id, 
      String? name, 
      num? price, 
      String? createdAt, 
      String? updatedAt, 
      List<dynamic>? translations,}){
    _id = id;
    _name = name;
    _price = price;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _translations = translations;
}

  AddOns.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _price = json['price'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    if (json['translations'] != null) {
      _translations = [];
      json['translations'].forEach((v) {
        _translations?.add(json.fromJson(v));
      });
    }
  }
  num? _id;
  String? _name;
  num? _price;
  String? _createdAt;
  String? _updatedAt;
  List<dynamic>? _translations;
AddOns copyWith({  num? id,
  String? name,
  num? price,
  String? createdAt,
  String? updatedAt,
  List<dynamic>? translations,
}) => AddOns(  id: id ?? _id,
  name: name ?? _name,
  price: price ?? _price,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  translations: translations ?? _translations,
);
  num? get id => _id;
  String? get name => _name;
  num? get price => _price;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  List<dynamic>? get translations => _translations;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['price'] = _price;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    if (_translations != null) {
      map['translations'] = _translations?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}