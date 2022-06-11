import 'dart:convert';

Products coursesListPaginationFromJson(String str) =>
    Products.fromJson(json.decode(str));

String coursesListPaginationToJson(Products data) => json.encode(data.toJson());

class Products {
  Products({
    required this.status,
    required this.code,
    required this.message,
    required this.data,
    required this.paginator,
  });
  late final bool status;
  late final int code;
  late final String message;
  late final List<ProductData> data;
  late final Paginator paginator;

  Products.fromJson(Map<String, dynamic> json){
    status = json['status'];
    code = json['code'];
    message = json['message'];
    data = List.from(json['data']).map((e)=>ProductData.fromJson(e)).toList();
    paginator = Paginator.fromJson(json['paginator']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['code'] = code;
    _data['message'] = message;
    _data['data'] = data.map((e)=>e.toJson()).toList();
    _data['paginator'] = paginator.toJson();
    return _data;
  }
}

class ProductData {
  ProductData({
    required this.id,
    required this.name,
    // required this.sku,
    required this.image,
    required this.isOutOfStock,
    required this.storehouseManagement,
    required this.quantity,
    required this.views,
    required this.reviewsCount,
    // required this.reviewsAvg,
    required this.isFavorite,
    required this.price,
    // required this.salePrice,
    required this.priceSymbol,
    required this.salePercentage,
    required this.isProductOnSale,
    required this.brand,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final String name;
  // late final String sku;
  late final String image;
  late final bool isOutOfStock;
  late final bool storehouseManagement;
  late final int quantity;
  late final int views;
  late final int reviewsCount;
  // late final  reviewsAvg;
  late final bool isFavorite;
  late final  price;
  // late final int salePrice;
  late final String priceSymbol;
  late final String salePercentage;
  late final bool isProductOnSale;
  late final Brand brand;
  late final String createdAt;
  late final String updatedAt;

  ProductData.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    // sku = json['sku'];
    image = json['image'];
    isOutOfStock = json['is_out_of_stock'];
    storehouseManagement = json['storehouse_management'];
    quantity = json['quantity'];
    views = json['views'];
    reviewsCount = json['reviews_count'];
    // reviewsAvg = json['reviews_avg'];
    isFavorite = json['is_favorite'];
    price = json['price'];
    // salePrice = json['salePrice'];
    priceSymbol = json['price_symbol'];
    salePercentage = json['sale_percentage'];
    isProductOnSale = json['is_product_on_sale'];
    brand = Brand.fromJson(json['brand']);
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    // _data['sku'] = sku;
    _data['image'] = image;
    _data['is_out_of_stock'] = isOutOfStock;
    _data['storehouse_management'] = storehouseManagement;
    _data['quantity'] = quantity;
    _data['views'] = views;
    _data['reviews_count'] = reviewsCount;
    // _data['reviews_avg'] = reviewsAvg;
    _data['is_favorite'] = isFavorite;
    _data['price'] = price;
    // _data['sale_price'] = salePrice;
    _data['price_symbol'] = priceSymbol;
    _data['sale_percentage'] = salePercentage;
    _data['is_product_on_sale'] = isProductOnSale;
    _data['brand'] = brand.toJson();
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}

class Brand {
  Brand({
    // required this.id,
    required this.name,
    required this.logo,
  });
  // late final int id;
  late final  name;
  late final String logo;

  Brand.fromJson(Map<String, dynamic> json){
    // id = json['id'];
    name = json['name'];
    logo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    // _data['id'] = id;
    _data['name'] = name;
    _data['logo'] = logo;
    return _data;
  }
}

class Paginator {
  Paginator({
    required this.totalCount,
    required this.totalPages,
    required this.currentPage,
    required this.perPage,
  });
  late final int totalCount;
  late final int totalPages;
  late final int currentPage;
  late final int perPage;

  Paginator.fromJson(Map<String, dynamic> json){
    totalCount = json['total_count'];
    totalPages = json['total_pages'];
    currentPage = json['current_page'];
    perPage = json['per_page'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['total_count'] = totalCount;
    _data['total_pages'] = totalPages;
    _data['current_page'] = currentPage;
    _data['per_page'] = perPage;
    return _data;
  }
}