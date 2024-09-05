class HistoryModel {
  String id;
  DateTime? orderAt;
  String estimatedArrival;
  String shippingName;
  String shippingInfo;
  double totalPrice;
  double shippingPrice;
  int packageStatus;
  List<Product>? products;

  HistoryModel({
    this.id = '',
    this.orderAt,
    this.estimatedArrival = '',
    this.shippingName = '',
    this.shippingInfo = '',
    this.totalPrice = 0.00,
    this.shippingPrice = 0.00,
    this.packageStatus = 0,
    this.products,
  });

  factory HistoryModel.fromJson(Map<String, dynamic> json) {
    double price = 0.00;
    double shippingInfo = 0.00;
    //check if int change to double <--- can change it to util
    if (json['total_price'] is int) {
      price = double.tryParse(json['total_price'].toString()) ?? 0.00;
    } else {
      price = json['total_price'] ?? 0.00;
    }
    if (json['shipping_price'] is int) {
      shippingInfo = double.tryParse(json['shipping_price'].toString()) ?? 0.00;
    } else {
      shippingInfo = json['shipping_price'] ?? 0.00;
    }
    return HistoryModel(
      id: json['id'],
      orderAt: DateTime.parse(json['order_at']),
      estimatedArrival: json['estimated_arrival'],
      shippingName: json['shipping_name'],
      shippingInfo: json['shipping_info'],
      totalPrice: price,
      shippingPrice: shippingInfo,
      packageStatus: json['package_status'],
      products: (json['products'] as List? ?? [])
          .map((item) => Product.fromJson(item))
          .toList(),
    );
  }
}

class Product {
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
  int qty;

  Product({
    this.id = 0,
    this.title = '',
    this.description = '',
    this.price = 0,
    this.discountPercentage = 0.00,
    this.rating = 0.00,
    this.stock = 10,
    this.brand = '',
    this.category = '',
    this.thumbnail = '',
    this.qty = 0,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price'],
      discountPercentage: json['discountPercentage'],
      rating: json['rating'],
      stock: json['stock'],
      brand: json['brand'],
      category: json['category'],
      thumbnail: json['thumbnail'],
      qty: json['qty'],
    );
  }
}
