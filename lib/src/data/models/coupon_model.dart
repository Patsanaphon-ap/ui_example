class CouponModel {
  int couponId;
  String code;
  Discount discount;
  DateTime? expirationDate;
  String terms;

  CouponModel({
    this.couponId = 0,
    this.code = '',
    Discount? discount,
    this.expirationDate,
    this.terms = '',
  }) : discount = discount ?? Discount();

  factory CouponModel.fromJson(Map<String, dynamic> json) {
    return CouponModel(
      couponId: json['coupon_id'],
      code: json['code'],
      discount: Discount.fromJson(json['discount'] ?? {}),
      expirationDate: DateTime.parse(json['expiration_date'] ?? ''),
      terms: json['terms'],
    );
  }
}

class Discount {
  String type = '';
  String title = '';
  int value = 0;

  Discount({
    this.type = '',
    this.title = '',
    this.value = 0,
  });

  factory Discount.fromJson(Map<String, dynamic> json) {
    return Discount(
      type: json['type'] ?? '',
      title: json['title'] ?? '',
      value: json['value'] ?? 0,
    );
  }
}
