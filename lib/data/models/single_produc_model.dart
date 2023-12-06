// To parse this JSON data, do
//
//     final singleProductModel = singleProductModelFromJson(jsonString);

import 'dart:convert';

SingleProductModel singleProductModelFromJson(String str) =>
    SingleProductModel.fromJson(json.decode(str));

String singleProductModelToJson(SingleProductModel data) =>
    json.encode(data.toJson());

class SingleProductModel {
  Products? products;

  SingleProductModel({
    this.products,
  });

  factory SingleProductModel.fromJson(Map<String, dynamic> json) =>
      SingleProductModel(
        products: json["products"] == null
            ? null
            : Products.fromJson(json["products"]),
      );

  Map<String, dynamic> toJson() => {
        "products": products?.toJson(),
      };
}

class Products {
  List<Aggregation>? aggregations;
  List<Item>? items;
  SortFields? sortFields;
  PageInfo? pageInfo;

  Products({
    this.aggregations,
    this.items,
    this.sortFields,
    this.pageInfo,
  });

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        aggregations: json["aggregations"] == null
            ? []
            : List<Aggregation>.from(
                json["aggregations"]!.map((x) => Aggregation.fromJson(x))),
        items: json["items"] == null
            ? []
            : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
        sortFields: json["sort_fields"] == null
            ? null
            : SortFields.fromJson(json["sort_fields"]),
        pageInfo: json["page_info"] == null
            ? null
            : PageInfo.fromJson(json["page_info"]),
      );

  Map<String, dynamic> toJson() => {
        "aggregations": aggregations == null
            ? []
            : List<dynamic>.from(aggregations!.map((x) => x.toJson())),
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toJson())),
        "sort_fields": sortFields?.toJson(),
        "page_info": pageInfo?.toJson(),
      };
}

class Aggregation {
  String? attributeCode;
  int? count;
  String? label;
  List<AggregationOption>? options;

  Aggregation({
    this.attributeCode,
    this.count,
    this.label,
    this.options,
  });

  factory Aggregation.fromJson(Map<String, dynamic> json) => Aggregation(
        attributeCode: json["attribute_code"] ?? '',
        count: json["count"] ?? 0,
        label: json["label"] ?? '',
        options: json["options"] == null
            ? []
            : List<AggregationOption>.from(
                json["options"]!.map((x) => AggregationOption.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "attribute_code": attributeCode,
        "count": count,
        "label": label,
        "options": options == null
            ? []
            : List<dynamic>.from(options!.map((x) => x.toJson())),
      };
}

class AggregationOption {
  String? label;
  String? value;
  int? count;

  AggregationOption({
    this.label,
    this.value,
    this.count,
  });

  factory AggregationOption.fromJson(Map<String, dynamic> json) =>
      AggregationOption(
        label: json["label"] ?? "",
        value: json["value"] ?? '',
        count: json["count"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "value": value,
        "count": count,
      };
}

class Item {
  String? name;
  String? sku;
  String? urlKey;
  String? urlSuffix;
  Image? image;
  int? ratingSummary;
  int? reviewCount;
  String? stockStatus;
  List<Category>? categories;
  dynamic weight;
  Description? description;
  Description? shortDescription;
  String? typename;
  dynamic specialPrice;
  PriceRange? priceRange;
  List<ConfigurableOption>? configurableOptions;
  List<Variant>? variants;
  List<MediaGallery>? mediaGallery;
  List<RelatedProduct>? relatedProducts;

  Item({
    this.name,
    this.sku,
    this.urlKey,
    this.urlSuffix,
    this.image,
    this.ratingSummary,
    this.reviewCount,
    this.stockStatus,
    this.categories,
    this.weight,
    this.description,
    this.shortDescription,
    this.typename,
    this.specialPrice,
    this.priceRange,
    this.configurableOptions,
    this.variants,
    this.mediaGallery,
    this.relatedProducts,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        name: json["name"] ?? '',
        sku: json["sku"] ?? '',
        urlKey: json["url_key"],
        urlSuffix: json["url_suffix"],
        image: json["image"] == null ? null : Image.fromJson(json["image"]),
        ratingSummary: json["rating_summary"],
        reviewCount: json["review_count"],
        stockStatus: json["stock_status"],
        categories: json["categories"] == null
            ? []
            : List<Category>.from(
                json["categories"]!.map((x) => Category.fromJson(x))),
        weight: json["weight"],
        description: json["description"] == null
            ? null
            : Description.fromJson(json["description"]),
        shortDescription: json["short_description"] == null
            ? null
            : Description.fromJson(json["short_description"]),
        typename: json["__typename"],
        specialPrice: json["special_price"],
        priceRange: json["price_range"] == null
            ? null
            : PriceRange.fromJson(json["price_range"]),
        configurableOptions: json["configurable_options"] == null
            ? []
            : List<ConfigurableOption>.from(json["configurable_options"]!
                .map((x) => ConfigurableOption.fromJson(x))),
        variants: json["variants"] == null
            ? []
            : List<Variant>.from(
                json["variants"]!.map((x) => Variant.fromJson(x))),
        mediaGallery: json["media_gallery"] == null
            ? []
            : List<MediaGallery>.from(
                json["media_gallery"]!.map((x) => MediaGallery.fromJson(x))),
        relatedProducts: json["related_products"] == null
            ? []
            : List<RelatedProduct>.from(json["related_products"]!
                .map((x) => RelatedProduct.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "sku": sku,
        "url_key": urlKey,
        "url_suffix": urlSuffix,
        "image": image?.toJson(),
        "rating_summary": ratingSummary,
        "review_count": reviewCount,
        "stock_status": stockStatus,
        "categories": categories == null
            ? []
            : List<dynamic>.from(categories!.map((x) => x.toJson())),
        "weight": weight,
        "description": description?.toJson(),
        "short_description": shortDescription?.toJson(),
        "__typename": typename,
        "special_price": specialPrice,
        "price_range": priceRange?.toJson(),
        "configurable_options": configurableOptions == null
            ? []
            : List<dynamic>.from(configurableOptions!.map((x) => x.toJson())),
        "variants": variants == null
            ? []
            : List<dynamic>.from(variants!.map((x) => x.toJson())),
        "media_gallery": mediaGallery == null
            ? []
            : List<dynamic>.from(mediaGallery!.map((x) => x.toJson())),
        "related_products": relatedProducts == null
            ? []
            : List<dynamic>.from(relatedProducts!.map((x) => x.toJson())),
      };
}

class Category {
  String? name;
  String? uid;
  String? path;
  int? id;

  Category({
    this.name,
    this.uid,
    this.path,
    this.id,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        name: json["name"],
        uid: json["uid"],
        path: json["path"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "uid": uid,
        "path": path,
        "id": id,
      };
}

class ConfigurableOption {
  int? id;
  int? attributeIdV2;
  String? label;
  int? position;
  bool? useDefault;
  Code? attributeCode;
  List<Value>? values;
  int? productId;

  ConfigurableOption({
    this.id,
    this.attributeIdV2,
    this.label,
    this.position,
    this.useDefault,
    this.attributeCode,
    this.values,
    this.productId,
  });

  factory ConfigurableOption.fromJson(Map<String, dynamic> json) =>
      ConfigurableOption(
        id: json["id"],
        attributeIdV2: json["attribute_id_v2"],
        label: json["label"],
        position: json["position"],
        useDefault: json["use_default"],
        attributeCode: codeValues.map[json["attribute_code"]]!,
        values: json["values"] == null
            ? []
            : List<Value>.from(json["values"]!.map((x) => Value.fromJson(x))),
        productId: json["product_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "attribute_id_v2": attributeIdV2,
        "label": label,
        "position": position,
        "use_default": useDefault,
        "attribute_code": codeValues.reverse[attributeCode],
        "values": values == null
            ? []
            : List<dynamic>.from(values!.map((x) => x.toJson())),
        "product_id": productId,
      };
}

enum Code { COLOR, SIZE }

final codeValues = EnumValues({"color": Code.COLOR, "size": Code.SIZE});

class Value {
  String? uid;
  int? valueIndex;
  String? label;
  SwatchData? swatchData;
  Code? code;

  Value({
    this.uid,
    this.valueIndex,
    this.label,
    this.swatchData,
    this.code,
  });

  factory Value.fromJson(Map<String, dynamic> json) => Value(
        uid: json["uid"],
        valueIndex: json["value_index"],
        label: json["label"],
        swatchData: json["swatch_data"] == null
            ? null
            : SwatchData.fromJson(json["swatch_data"]),
        code: codeValues.map[json["code"]] ?? Code.SIZE,
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "value_index": valueIndex,
        "label": label,
        "swatch_data": swatchData?.toJson(),
        "code": codeValues.reverse[code],
      };
}

class SwatchData {
  String? value;

  SwatchData({
    this.value,
  });

  factory SwatchData.fromJson(Map<String, dynamic> json) => SwatchData(
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
      };
}

class Description {
  String? html;

  Description({
    this.html,
  });

  factory Description.fromJson(Map<String, dynamic> json) => Description(
        html: json["html"],
      );

  Map<String, dynamic> toJson() => {
        "html": html,
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

class MediaGallery {
  String? url;
  String? label;

  MediaGallery({
    this.url,
    this.label,
  });

  factory MediaGallery.fromJson(Map<String, dynamic> json) => MediaGallery(
        url: json["url"],
        label: json["label"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "label": label,
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
  Currency? currency;

  RegularPrice({
    this.value,
    this.currency,
  });

  factory RegularPrice.fromJson(Map<String, dynamic> json) => RegularPrice(
        value: json["value"],
        currency: currencyValues.map[json["currency"]]!,
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "currency": currencyValues.reverse[currency],
      };
}

enum Currency { USD }

final currencyValues = EnumValues({"USD": Currency.USD});

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

class Variant {
  Product? product;
  List<Value>? attributes;

  Variant({
    this.product,
    this.attributes,
  });

  factory Variant.fromJson(Map<String, dynamic> json) => Variant(
        product:
            json["product"] == null ? null : Product.fromJson(json["product"]),
        attributes: json["attributes"] == null
            ? []
            : List<Value>.from(
                json["attributes"]!.map((x) => Value.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "product": product?.toJson(),
        "attributes": attributes == null
            ? []
            : List<dynamic>.from(attributes!.map((x) => x.toJson())),
      };
}

class Product {
  int? id;
  String? name;
  String? sku;
  int? attributeSetId;
  List<MediaGallery>? mediaGallery;
  int? weight;
  PriceRange? priceRange;

  Product({
    this.id,
    this.name,
    this.sku,
    this.attributeSetId,
    this.mediaGallery,
    this.weight,
    this.priceRange,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        sku: json["sku"],
        attributeSetId: json["attribute_set_id"],
        mediaGallery: json["media_gallery"] == null
            ? []
            : List<MediaGallery>.from(
                json["media_gallery"]!.map((x) => MediaGallery.fromJson(x))),
        weight: json["weight"],
        priceRange: json["price_range"] == null
            ? null
            : PriceRange.fromJson(json["price_range"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "sku": sku,
        "attribute_set_id": attributeSetId,
        "media_gallery": mediaGallery == null
            ? []
            : List<dynamic>.from(mediaGallery!.map((x) => x.toJson())),
        "weight": weight,
        "price_range": priceRange?.toJson(),
      };
}

class PageInfo {
  int? currentPage;
  int? pageSize;
  int? totalPages;

  PageInfo({
    this.currentPage,
    this.pageSize,
    this.totalPages,
  });

  factory PageInfo.fromJson(Map<String, dynamic> json) => PageInfo(
        currentPage: json["current_page"],
        pageSize: json["page_size"],
        totalPages: json["total_pages"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "page_size": pageSize,
        "total_pages": totalPages,
      };
}

class SortFields {
  String? sortFieldsDefault;
  List<SortFieldsOption>? options;

  SortFields({
    this.sortFieldsDefault,
    this.options,
  });

  factory SortFields.fromJson(Map<String, dynamic> json) => SortFields(
        sortFieldsDefault: json["default"],
        options: json["options"] == null
            ? []
            : List<SortFieldsOption>.from(
                json["options"]!.map((x) => SortFieldsOption.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "default": sortFieldsDefault,
        "options": options == null
            ? []
            : List<dynamic>.from(options!.map((x) => x.toJson())),
      };
}

class SortFieldsOption {
  String? label;
  String? value;

  SortFieldsOption({
    this.label,
    this.value,
  });

  factory SortFieldsOption.fromJson(Map<String, dynamic> json) =>
      SortFieldsOption(
        label: json["label"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "value": value,
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

class RelatedProduct {
  String? name;
  String? sku;
  String? urlKey;
  String? urlSuffix;
  Image? image;
  int? ratingSummary;
  int? reviewCount;
  String? stockStatus;
  List<Category>? categories;
  PriceRange? priceRange;

  RelatedProduct({
    this.name,
    this.sku,
    this.urlKey,
    this.urlSuffix,
    this.image,
    this.ratingSummary,
    this.reviewCount,
    this.stockStatus,
    this.categories,
    this.priceRange,
  });

  factory RelatedProduct.fromJson(Map<String, dynamic> json) => RelatedProduct(
        name: json["name"],
        sku: json["sku"],
        urlKey: json["url_key"],
        urlSuffix: json["url_suffix"],
        image: json["image"] == null ? null : Image.fromJson(json["image"]),
        ratingSummary: json["rating_summary"],
        reviewCount: json["review_count"],
        stockStatus: json["stock_status"],
        categories: json["categories"] == null
            ? []
            : List<Category>.from(
                json["categories"]!.map((x) => Category.fromJson(x))),
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
        "rating_summary": ratingSummary,
        "review_count": reviewCount,
        "stock_status": stockStatus,
        "categories": categories == null
            ? []
            : List<dynamic>.from(categories!.map((x) => x.toJson())),
        "price_range": priceRange?.toJson(),
      };
}
