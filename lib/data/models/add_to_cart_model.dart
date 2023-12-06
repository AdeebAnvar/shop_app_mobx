// To parse this JSON data, do
//
//     final addProductsToCart = addProductsToCartFromJson(jsonString);

import 'dart:convert';

AddProductsToCart addProductsToCartFromJson(String str) =>
    AddProductsToCart.fromJson(json.decode(str));

String addProductsToCartToJson(AddProductsToCart data) =>
    json.encode(data.toJson());

class AddProductsToCart {
  AddProductsToCartClass? addProductsToCart;

  AddProductsToCart({
    this.addProductsToCart,
  });

  factory AddProductsToCart.fromJson(Map<String, dynamic> json) =>
      AddProductsToCart(
        addProductsToCart: json["addProductsToCart"] == null
            ? null
            : AddProductsToCartClass.fromJson(json["addProductsToCart"]),
      );

  Map<String, dynamic> toJson() => {
        "addProductsToCart": addProductsToCart?.toJson(),
      };
}

class AddProductsToCartClass {
  Cart? cart;
  List<dynamic>? userErrors;

  AddProductsToCartClass({
    this.cart,
    this.userErrors,
  });

  factory AddProductsToCartClass.fromJson(Map<String, dynamic> json) =>
      AddProductsToCartClass(
        cart: json["cart"] == null ? null : Cart.fromJson(json["cart"]),
        userErrors: json["user_errors"] == null
            ? []
            : List<dynamic>.from(json["user_errors"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "cart": cart?.toJson(),
        "user_errors": userErrors == null
            ? []
            : List<dynamic>.from(userErrors!.map((x) => x)),
      };
}

class Cart {
  List<Item>? items;
  int? totalQuantity;

  Cart({
    this.items,
    this.totalQuantity,
  });

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        items: json["items"] == null
            ? []
            : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
        totalQuantity: json["total_quantity"],
      );

  Map<String, dynamic> toJson() => {
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toJson())),
        "total_quantity": totalQuantity,
      };
}

class Item {
  String? id;
  Product? product;
  int? quantity;

  Item({
    this.id,
    this.product,
    this.quantity,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        product:
            json["product"] == null ? null : Product.fromJson(json["product"]),
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product": product?.toJson(),
        "quantity": quantity,
      };
}

class Product {
  String? name;
  String? sku;
  String? urlKey;
  String? urlSuffix;
  Image? image;
  String? stockStatus;
  dynamic specialPrice;
  PriceRange? priceRange;

  Product({
    this.name,
    this.sku,
    this.urlKey,
    this.urlSuffix,
    this.image,
    this.stockStatus,
    this.specialPrice,
    this.priceRange,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        name: json["name"],
        sku: json["sku"],
        urlKey: json["url_key"],
        urlSuffix: json["url_suffix"],
        image: json["image"] == null ? null : Image.fromJson(json["image"]),
        stockStatus: json["stock_status"],
        specialPrice: json["special_price"],
        priceRange: json["price_range"] == null
            ? null
            : PriceRange.fromJson(json["price_range"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "sku": sku,
        "url_key": urlKey,
        "url_suffix": urlSuffix,
        "image": image?.toJson(),
        "stock_status": stockStatus,
        "special_price": specialPrice,
        "price_range": priceRange?.toJson(),
      };
}

class Image {
  String? url;

  Image({
    this.url,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
      };
}

class PriceRange {
  MinimumPrice? minimumPrice;
  MaximumPrice? maximumPrice;

  PriceRange({
    this.minimumPrice,
    this.maximumPrice,
  });

  factory PriceRange.fromJson(Map<String, dynamic> json) => PriceRange(
        minimumPrice: json["minimum_price"] == null
            ? null
            : MinimumPrice.fromJson(json["minimum_price"]),
        maximumPrice: json["maximum_price"] == null
            ? null
            : MaximumPrice.fromJson(json["maximum_price"]),
      );

  Map<String, dynamic> toJson() => {
        "minimum_price": minimumPrice?.toJson(),
        "maximum_price": maximumPrice?.toJson(),
      };
}

class MaximumPrice {
  RegularPrice? regularPrice;
  Discount? discount;

  MaximumPrice({
    this.regularPrice,
    this.discount,
  });

  factory MaximumPrice.fromJson(Map<String, dynamic> json) => MaximumPrice(
        regularPrice: json["regular_price"] == null
            ? null
            : RegularPrice.fromJson(json["regular_price"]),
        discount: json["discount"] == null
            ? null
            : Discount.fromJson(json["discount"]),
      );

  Map<String, dynamic> toJson() => {
        "regular_price": regularPrice?.toJson(),
        "discount": discount?.toJson(),
      };
}

class Discount {
  int? amountOff;
  int? percentOff;

  Discount({
    this.amountOff,
    this.percentOff,
  });

  factory Discount.fromJson(Map<String, dynamic> json) => Discount(
        amountOff: json["amount_off"],
        percentOff: json["percent_off"],
      );

  Map<String, dynamic> toJson() => {
        "amount_off": amountOff,
        "percent_off": percentOff,
      };
}

class RegularPrice {
  int? value;
  String? currency;

  RegularPrice({
    this.value,
    this.currency,
  });

  factory RegularPrice.fromJson(Map<String, dynamic> json) => RegularPrice(
        value: json["value"],
        currency: json["currency"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "currency": currency,
      };
}

class MinimumPrice {
  RegularPrice? regularPrice;

  MinimumPrice({
    this.regularPrice,
  });

  factory MinimumPrice.fromJson(Map<String, dynamic> json) => MinimumPrice(
        regularPrice: json["regular_price"] == null
            ? null
            : RegularPrice.fromJson(json["regular_price"]),
      );

  Map<String, dynamic> toJson() => {
        "regular_price": regularPrice?.toJson(),
      };
}
