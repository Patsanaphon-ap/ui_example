class CateogryModel {
  String type;
  String image;

  CateogryModel({
    this.type = '',
    this.image = '',
  });

  factory CateogryModel.fromJson(Map<String, dynamic> json) {
    return CateogryModel(
      type: json['type'] ?? 0,
      image: json['image'] ?? '',
    );
  }
}
