class ProductModel {
  int id;
  String title;
  String description;
  int price;
  double discountPercentage;
  double rating;
  int stock;
  String brand;
  String category;
  String thumbnail;
  List<String>? images;

  ProductModel({
    this.id = 0,
    this.title = '',
    this.description = '',
    this.price = 0,
    this.discountPercentage = 0.00,
    this.rating = 0.00,
    this.stock = 0,
    this.brand = '',
    this.category = '',
    this.thumbnail = '',
    this.images,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      price: json['price'] ?? 0,
      discountPercentage: (json['discountPercentage'] ?? 0.00).toDouble(),
      rating: (json['rating'] ?? 0.00).toDouble(),
      stock: json['stock'] ?? 0,
      brand: json['brand'] ?? '',
      category: json['category'] ?? '',
      thumbnail: json['thumbnail'] ?? '',
      images: (json['images'] as List<dynamic>?)
              ?.map((item) => item as String)
              .toList() ??
          [],
    );
  }
}
