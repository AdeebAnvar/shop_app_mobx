// To parse this JSON data, do
//
//     final createEmptyCartModel = createEmptyCartModelFromJson(jsonString);

import 'dart:convert';

CreateEmptyCartModel createEmptyCartModelFromJson(String str) =>
    CreateEmptyCartModel.fromJson(json.decode(str));

String createEmptyCartModelToJson(CreateEmptyCartModel data) =>
    json.encode(data.toJson());

class CreateEmptyCartModel {
  String? createEmptyCart;

  CreateEmptyCartModel({
    this.createEmptyCart,
  });

  factory CreateEmptyCartModel.fromJson(Map<String, dynamic> json) =>
      CreateEmptyCartModel(
        createEmptyCart: json["createEmptyCart"],
      );

  Map<String, dynamic> toJson() => {
        "createEmptyCart": createEmptyCart,
      };
}
