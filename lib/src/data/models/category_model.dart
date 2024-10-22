class CategoryModel {
  String type;
  String image;

  CategoryModel({
    this.type = '',
    this.image = '',
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      type: json['type'] ?? 0,
      image: json['image'] ?? '',
    );
  }
}
