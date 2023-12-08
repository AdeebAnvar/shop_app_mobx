// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CustomerCartModel {
  String customerCartId;
  CustomerCartModel({
    required this.customerCartId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'customerCartId': customerCartId,
    };
  }

  factory CustomerCartModel.fromMap(Map<String, dynamic> map) {
    return CustomerCartModel(
      customerCartId: map['customerCartId'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CustomerCartModel.fromJson(String source) =>
      CustomerCartModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
