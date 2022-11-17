/// id : 3
/// f_name : "Nayon"
/// l_name : "Talukder"
/// email : "n@gmail.com"
/// image : null
/// is_phone_verified : 0
/// email_verified_at : null
/// created_at : "2022-11-16T05:28:38.000000Z"
/// updated_at : "2022-11-17T05:43:06.000000Z"
/// email_verification_token : null
/// phone : "+88018125364"
/// cm_firebase_token : null
/// point : 0
/// temporary_token : "AuXAEIPzi2p2Ks4ganiT5kwaagSQz38G5v7twiUf"

class UserProfileModel {
  UserProfileModel({
      num? id, 
      String? fName, 
      String? lName, 
      String? email, 
      dynamic image, 
      num? isPhoneVerified, 
      dynamic emailVerifiedAt, 
      String? createdAt, 
      String? updatedAt, 
      dynamic emailVerificationToken, 
      String? phone, 
      dynamic cmFirebaseToken, 
      num? point, 
      String? temporaryToken,}){
    _id = id;
    _fName = fName;
    _lName = lName;
    _email = email;
    _image = image;
    _isPhoneVerified = isPhoneVerified;
    _emailVerifiedAt = emailVerifiedAt;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _emailVerificationToken = emailVerificationToken;
    _phone = phone;
    _cmFirebaseToken = cmFirebaseToken;
    _point = point;
    _temporaryToken = temporaryToken;
}

  UserProfileModel.fromJson(dynamic json) {
    _id = json['id'];
    _fName = json['f_name'];
    _lName = json['l_name'];
    _email = json['email'];
    _image = json['image'];
    _isPhoneVerified = json['is_phone_verified'];
    _emailVerifiedAt = json['email_verified_at'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _emailVerificationToken = json['email_verification_token'];
    _phone = json['phone'];
    _cmFirebaseToken = json['cm_firebase_token'];
    _point = json['point'];
    _temporaryToken = json['temporary_token'];
  }
  num? _id;
  String? _fName;
  String? _lName;
  String? _email;
  dynamic _image;
  num? _isPhoneVerified;
  dynamic _emailVerifiedAt;
  String? _createdAt;
  String? _updatedAt;
  dynamic _emailVerificationToken;
  String? _phone;
  dynamic _cmFirebaseToken;
  num? _point;
  String? _temporaryToken;
UserProfileModel copyWith({  num? id,
  String? fName,
  String? lName,
  String? email,
  dynamic image,
  num? isPhoneVerified,
  dynamic emailVerifiedAt,
  String? createdAt,
  String? updatedAt,
  dynamic emailVerificationToken,
  String? phone,
  dynamic cmFirebaseToken,
  num? point,
  String? temporaryToken,
}) => UserProfileModel(  id: id ?? _id,
  fName: fName ?? _fName,
  lName: lName ?? _lName,
  email: email ?? _email,
  image: image ?? _image,
  isPhoneVerified: isPhoneVerified ?? _isPhoneVerified,
  emailVerifiedAt: emailVerifiedAt ?? _emailVerifiedAt,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  emailVerificationToken: emailVerificationToken ?? _emailVerificationToken,
  phone: phone ?? _phone,
  cmFirebaseToken: cmFirebaseToken ?? _cmFirebaseToken,
  point: point ?? _point,
  temporaryToken: temporaryToken ?? _temporaryToken,
);
  num? get id => _id;
  String? get fName => _fName;
  String? get lName => _lName;
  String? get email => _email;
  dynamic get image => _image;
  num? get isPhoneVerified => _isPhoneVerified;
  dynamic get emailVerifiedAt => _emailVerifiedAt;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  dynamic get emailVerificationToken => _emailVerificationToken;
  String? get phone => _phone;
  dynamic get cmFirebaseToken => _cmFirebaseToken;
  num? get point => _point;
  String? get temporaryToken => _temporaryToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['f_name'] = _fName;
    map['l_name'] = _lName;
    map['email'] = _email;
    map['image'] = _image;
    map['is_phone_verified'] = _isPhoneVerified;
    map['email_verified_at'] = _emailVerifiedAt;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['email_verification_token'] = _emailVerificationToken;
    map['phone'] = _phone;
    map['cm_firebase_token'] = _cmFirebaseToken;
    map['point'] = _point;
    map['temporary_token'] = _temporaryToken;
    return map;
  }

}