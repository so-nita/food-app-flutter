class Product {
  String? id;
  String? name;
  String? imageurl;
  double? price;
  bool? isrecommend;
  bool? ispopular;
  String? categoryid;

  Product(
      {this.id,
      this.name,
      this.imageurl,
      this.price,
      this.isrecommend,
      this.ispopular,
      this.categoryid});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imageurl = json['imageurl'];
    price = json['price'];
    isrecommend = json['isrecommend'];
    ispopular = json['ispopular'];
    categoryid = json['categoryid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['imageurl'] = imageurl;
    data['price'] = price;
    data['isrecommend'] = isrecommend;
    data['ispopular'] = ispopular;
    data['categoryid'] = categoryid;
    return data;
  }
}
