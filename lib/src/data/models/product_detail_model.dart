class ProductModel {
  int id;
  String title;
  String description;
  int price;
  double discountPercentage;
  double rating;
  int comment;
  int stock;
  String brand;
  String category;
  String thumbnail;
  int qty;
  List<String>? images;
  Specifications? specifications;
  List<Review>? reviews;
  String availability;
  DeliveryOptions? deliveryOptions;
  String warranty;
  String returnPolicy;
  List<RelatedProduct>? relatedProducts;

  ProductModel({
    this.id = 0,
    this.title = '',
    this.description = '',
    this.price = 0,
    this.discountPercentage = 0.00,
    this.rating = 0.00,
    this.comment = 0,
    this.stock = 0,
    this.brand = '',
    this.category = '',
    this.thumbnail = '',
    this.qty = 0,
    this.images,
    this.specifications,
    this.reviews,
    this.availability = '',
    this.deliveryOptions,
    this.warranty = '',
    this.returnPolicy = '',
    this.relatedProducts,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      price: json['price'] ?? 0,
      discountPercentage: (json['discountPercentage'] ?? 0.00).toDouble(),
      rating: (json['rating'] ?? 0.00).toDouble(),
      comment: json['comment'] ?? 0,
      stock: json['stock'] ?? 0,
      brand: json['brand'] ?? '',
      category: json['category'] ?? '',
      thumbnail: json['thumbnail'] ?? '',
      images: (json['images'] as List<dynamic>?)
              ?.map((item) => item as String)
              .toList() ??
          [],
      specifications: Specifications.fromJson(json['specifications'] ?? {}),
      reviews: (json['reviews'] as List<dynamic>?)
              ?.map(
                (item) => Review.fromJson(item as Map<String, dynamic>),
              )
              .toList() ??
          [],
      availability: json['availability'] ?? '',
      deliveryOptions: DeliveryOptions.fromJson(json['deliveryOptions'] ?? {}),
      warranty: json['warranty'] ?? '',
      returnPolicy: json['returnPolicy'] ?? '',
      relatedProducts: (json['relatedProducts'] as List<dynamic>?)
              ?.map((item) =>
                  RelatedProduct.fromJson(item as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }
}

class DeliveryOptions {
  String standard;
  String express;
  String sameDay;

  DeliveryOptions({
    this.standard = '',
    this.express = '',
    this.sameDay = '',
  });

  factory DeliveryOptions.fromJson(Map<String, dynamic> json) {
    return DeliveryOptions(
      standard: json['standard'] ?? '',
      express: json['express'] ?? '',
      sameDay: json['same_day'] ?? '',
    );
  }
}

class RelatedProduct {
  int id;
  String title;
  double price;
  String thumbnail;

  RelatedProduct({
    this.id = 0,
    this.title = '',
    this.price = 0.00,
    this.thumbnail = '',
  });

  factory RelatedProduct.fromJson(Map<String, dynamic> json) {
    return RelatedProduct(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      thumbnail: json['thumbnail'],
    );
  }
}

class Review {
  String username;
  int rating;
  String comment;
  String date;

  Review({
    this.username = '',
    this.rating = 0,
    this.comment = '',
    this.date = '',
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      username: json['username'],
      rating: json['rating'],
      comment: json['comment'],
      date: json['date'],
    );
  }
}

class Specifications {
  final String material;
  final String color;
  final String weight;
  final Dimensions? dimensions;
  final List<String>? features;

  Specifications({
    this.material = '',
    this.color = '',
    this.weight = '',
    this.dimensions,
    this.features,
  });

  factory Specifications.fromJson(Map<String, dynamic> json) {
    return Specifications(
        material: json['material'] ?? '',
        color: json['color'] ?? '',
        weight: json['weight'] ?? '',
        dimensions: Dimensions.fromJson(json['dimensions'] ?? {}),
        features: List<String>.from(json['features'] ?? []));
  }
}

class Dimensions {
  final String height;
  final String width;
  final String depth;

  Dimensions({
    this.height = '',
    this.width = '',
    this.depth = '',
  });

  factory Dimensions.fromJson(Map<String, dynamic> json) {
    return Dimensions(
      height: json['height'] ?? '',
      width: json['width'] ?? '',
      depth: json['depth'] ?? '',
    );
  }
}
