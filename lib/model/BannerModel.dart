class BannerModel {
  BannerModel({
      this.id, 
      this.title, 
      this.image, 
      this.productId, 
      this.status, 
      this.createdAt, 
      this.updatedAt, 
      this.categoryId,});

  BannerModel.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    productId = json['product_id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    categoryId = json['category_id'];
  }
  int? id;
  String? title;
  String? image;
  int? productId;
  int? status;
  String? createdAt;
  String? updatedAt;
  dynamic categoryId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['image'] = image;
    map['product_id'] = productId;
    map['status'] = status;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['category_id'] = categoryId;
    return map;
  }

}