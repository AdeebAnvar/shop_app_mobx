// To parse this JSON data, do
//
//     final cartItemInputModel = cartItemInputModelFromJson(jsonString);

import 'dart:convert';

CartItemInputModel cartItemInputModelFromJson(String str) =>
    CartItemInputModel.fromJson(json.decode(str));

String cartItemInputModelToJson(CartItemInputModel data) =>
    json.encode(data.toJson());

class CartItemInputModel {
  String? cartIdString;
  List<CartItemsMap>? cartItemsMap;

  CartItemInputModel({
    this.cartIdString,
    this.cartItemsMap,
  });

  factory CartItemInputModel.fromJson(Map<String, dynamic> json) =>
      CartItemInputModel(
        cartIdString: json["cartIdString"],
        cartItemsMap: json["cartItemsMap"] == null
            ? []
            : List<CartItemsMap>.from(
                json["cartItemsMap"]!.map((x) => CartItemsMap.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "cartIdString": cartIdString,
        "cartItemsMap": cartItemsMap == null
            ? []
            : List<dynamic>.from(cartItemsMap!.map((x) => x.toJson())),
      };
}

class CartItemsMap {
  int? quantity;
  String? parentSku;
  String? sku;

  CartItemsMap({
    this.quantity,
    this.parentSku,
    this.sku,
  });

  factory CartItemsMap.fromJson(Map<String, dynamic> json) => CartItemsMap(
        quantity: json["quantity"],
        parentSku: json["parent_sku"],
        sku: json["sku"],
      );

  Map<String, dynamic> toJson() => {
        "quantity": quantity,
        "parent_sku": parentSku,
        "sku": sku,
      };
}
