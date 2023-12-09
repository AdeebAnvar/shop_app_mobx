// To parse this JSON data, do
//
//     final cartModel = cartModelFromJson(jsonString);

// ignore_for_file: constant_identifier_names

import 'dart:convert';

CartModel cartModelFromJson(String str) => CartModel.fromJson(json.decode(str));

String cartModelToJson(CartModel data) => json.encode(data.toJson());

class CartModel {
  Cart? cart;

  CartModel({
    this.cart,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        cart: json["cart"] == null ? null : Cart.fromJson(json["cart"]),
      );

  Map<String, dynamic> toJson() => {
        "cart": cart?.toJson(),
      };
}

class Cart {
  dynamic appliedCoupon;
  dynamic appliedCoupons;
  List<AvailablePaymentMethod>? availablePaymentMethods;
  dynamic billingAddress;
  String? email;
  dynamic giftMessage;
  String? id;
  bool? isVirtual;
  List<Item>? items;
  CartPrices? prices;
  SelectedPaymentMethod? selectedPaymentMethod;
  int? totalQuantity;

  Cart({
    this.appliedCoupon,
    this.appliedCoupons,
    this.availablePaymentMethods,
    this.billingAddress,
    this.email,
    this.giftMessage,
    this.id,
    this.isVirtual,
    this.items,
    this.prices,
    this.selectedPaymentMethod,
    this.totalQuantity,
  });

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        appliedCoupon: json["applied_coupon"],
        appliedCoupons: json["applied_coupons"],
        availablePaymentMethods: json["available_payment_methods"] == null
            ? []
            : List<AvailablePaymentMethod>.from(
                json["available_payment_methods"]!
                    .map((x) => AvailablePaymentMethod.fromJson(x))),
        billingAddress: json["billing_address"],
        email: json["email"],
        giftMessage: json["gift_message"],
        id: json["id"],
        isVirtual: json["is_virtual"],
        items: json["items"] == null
            ? []
            : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
        prices:
            json["prices"] == null ? null : CartPrices.fromJson(json["prices"]),
        selectedPaymentMethod: json["selected_payment_method"] == null
            ? null
            : SelectedPaymentMethod.fromJson(json["selected_payment_method"]),
        totalQuantity: json["total_quantity"],
      );

  Map<String, dynamic> toJson() => {
        "applied_coupon": appliedCoupon,
        "applied_coupons": appliedCoupons,
        "available_payment_methods": availablePaymentMethods == null
            ? []
            : List<dynamic>.from(
                availablePaymentMethods!.map((x) => x.toJson())),
        "billing_address": billingAddress,
        "email": email,
        "gift_message": giftMessage,
        "id": id,
        "is_virtual": isVirtual,
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toJson())),
        "prices": prices?.toJson(),
        "selected_payment_method": selectedPaymentMethod?.toJson(),
        "total_quantity": totalQuantity,
      };
}

class AvailablePaymentMethod {
  String? code;
  bool? isDeferred;
  String? title;

  AvailablePaymentMethod({
    this.code,
    this.isDeferred,
    this.title,
  });

  factory AvailablePaymentMethod.fromJson(Map<String, dynamic> json) =>
      AvailablePaymentMethod(
        code: json["code"],
        isDeferred: json["is_deferred"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "is_deferred": isDeferred,
        "title": title,
      };
}

class Item {
  dynamic errors;
  String? id;
  ItemPrices? prices;
  Product? product;
  int? quantity;
  String? uid;

  Item({
    this.errors,
    this.id,
    this.prices,
    this.product,
    this.quantity,
    this.uid,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        errors: json["errors"],
        id: json["id"],
        prices:
            json["prices"] == null ? null : ItemPrices.fromJson(json["prices"]),
        product:
            json["product"] == null ? null : Product.fromJson(json["product"]),
        quantity: json["quantity"],
        uid: json["uid"],
      );

  Map<String, dynamic> toJson() => {
        "errors": errors,
        "id": id,
        "prices": prices?.toJson(),
        "product": product?.toJson(),
        "quantity": quantity,
        "uid": uid,
      };
}

class ItemPrices {
  dynamic discounts;
  GrandTotal? price;
  GrandTotal? priceIncludingTax;
  GrandTotal? rowTotal;
  GrandTotal? rowTotalIncludingTax;
  GrandTotal? totalItemDiscount;

  ItemPrices({
    this.discounts,
    this.price,
    this.priceIncludingTax,
    this.rowTotal,
    this.rowTotalIncludingTax,
    this.totalItemDiscount,
  });

  factory ItemPrices.fromJson(Map<String, dynamic> json) => ItemPrices(
        discounts: json["discounts"],
        price:
            json["price"] == null ? null : GrandTotal.fromJson(json["price"]),
        priceIncludingTax: json["price_including_tax"] == null
            ? null
            : GrandTotal.fromJson(json["price_including_tax"]),
        rowTotal: json["row_total"] == null
            ? null
            : GrandTotal.fromJson(json["row_total"]),
        rowTotalIncludingTax: json["row_total_including_tax"] == null
            ? null
            : GrandTotal.fromJson(json["row_total_including_tax"]),
        totalItemDiscount: json["total_item_discount"] == null
            ? null
            : GrandTotal.fromJson(json["total_item_discount"]),
      );

  Map<String, dynamic> toJson() => {
        "discounts": discounts,
        "price": price?.toJson(),
        "price_including_tax": priceIncludingTax?.toJson(),
        "row_total": rowTotal?.toJson(),
        "row_total_including_tax": rowTotalIncludingTax?.toJson(),
        "total_item_discount": totalItemDiscount?.toJson(),
      };
}

class GrandTotal {
  Currency? currency;
  int? value;

  GrandTotal({
    this.currency,
    this.value,
  });

  factory GrandTotal.fromJson(Map<String, dynamic> json) => GrandTotal(
        currency: currencyValues.map[json["currency"]]!,
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "currency": currencyValues.reverse[currency],
        "value": value,
      };
}

enum Currency { USD }

final currencyValues = EnumValues({"USD": Currency.USD});

class Product {
  Image? image;
  String? urlKey;
  Product({
    this.image,
    this.urlKey,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        urlKey: json['url_key'] ?? '',
        image: json["image"] == null ? null : Image.fromJson(json["image"]),
      );

  Map<String, dynamic> toJson() => {
        "image": image?.toJson(),
        "url_key": urlKey,
      };
}

class Image {
  String? url;
  String? label;

  Image({
    this.url,
    this.label,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        url: json["url"],
        label: json["label"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "label": label,
      };
}

class CartPrices {
  GrandTotal? grandTotal;
  GrandTotal? subtotalWithDiscountExcludingTax;
  List<dynamic>? discounts;

  CartPrices({
    this.grandTotal,
    this.subtotalWithDiscountExcludingTax,
    this.discounts,
  });

  factory CartPrices.fromJson(Map<String, dynamic> json) => CartPrices(
        grandTotal: json["grand_total"] == null
            ? null
            : GrandTotal.fromJson(json["grand_total"]),
        subtotalWithDiscountExcludingTax:
            json["subtotal_with_discount_excluding_tax"] == null
                ? null
                : GrandTotal.fromJson(
                    json["subtotal_with_discount_excluding_tax"]),
        discounts: json["discounts"] == null
            ? []
            : List<dynamic>.from(json["discounts"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "grand_total": grandTotal?.toJson(),
        "subtotal_with_discount_excluding_tax":
            subtotalWithDiscountExcludingTax?.toJson(),
        "discounts": discounts == null
            ? []
            : List<dynamic>.from(discounts!.map((x) => x)),
      };
}

class SelectedPaymentMethod {
  String? code;
  dynamic purchaseOrderNumber;
  String? title;

  SelectedPaymentMethod({
    this.code,
    this.purchaseOrderNumber,
    this.title,
  });

  factory SelectedPaymentMethod.fromJson(Map<String, dynamic> json) =>
      SelectedPaymentMethod(
        code: json["code"],
        purchaseOrderNumber: json["purchase_order_number"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "purchase_order_number": purchaseOrderNumber,
        "title": title,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
