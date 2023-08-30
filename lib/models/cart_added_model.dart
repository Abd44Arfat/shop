// To parse this JSON data, do
//
//     final cartAddedModel = cartAddedModelFromJson(jsonString);

import 'dart:convert';

CartAddedModel cartAddedModelFromJson(String str) => CartAddedModel.fromJson(json.decode(str));

String cartAddedModelToJson(CartAddedModel data) => json.encode(data.toJson());

class CartAddedModel {
  bool status;
  String message;
  Data data;

  CartAddedModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory CartAddedModel.fromJson(Map<String, dynamic> json) => CartAddedModel(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  int id;
  Product product;

  Data({
    required this.id,
    required this.product,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    product: Product.fromJson(json["product"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "product": product.toJson(),
  };
}

class Product {
  int id;
  int price;
  int oldPrice;
  int discount;
  String image;

  Product({
    required this.id,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    price: json["price"],
    oldPrice: json["old_price"],
    discount: json["discount"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "price": price,
    "old_price": oldPrice,
    "discount": discount,
    "image": image,
  };
}
