import 'package:meta/meta.dart';
import 'dart:convert';

List<ProductItem> productItemFromJson(String str) => List<ProductItem>.from(
    json.decode(str).map((x) => ProductItem.fromJson(x)));

String productItemToJson(List<ProductItem> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductItem {
  ProductItem({
    this.quantity,
    this.id,
    this.name,
    this.price,
    this.description,
    this.category,
    this.image,
    this.priceKey,
    this.v,
  });

  int quantity = 0;
  String id;
  String name;
  int price;
  String description;
  String category;
  String image;
  String priceKey;
  int v;

  factory ProductItem.fromJson(Map<String, dynamic> json) => ProductItem(
        id: json["_id"],
        name: json["name"],
        price: json["price"],
        description: json["description"],
        category: json["category"],
        image: json["image"],
        priceKey: json["priceKey"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "price": price,
        "description": description,
        "category": category,
        "image": image,
        "priceKey": priceKey,
        "__v": v,
      };
}
