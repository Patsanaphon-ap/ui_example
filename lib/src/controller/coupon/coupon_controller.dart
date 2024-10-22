import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:presentation/src/data/models/coupon_model.dart';

class CouponController extends GetxController {
  bool isloading = true;
  List<CouponModel> couponData = [];

  @override
  void onInit() {
    Future.delayed(const Duration(milliseconds: 400))
        .then((value) => onLoadData());
    super.onInit();
  }

  Future<void> onLoadData() async {
    isloading = true;
    update();
    await Future.delayed(const Duration(milliseconds: 1000));
    String jsonString = await rootBundle.loadString('assets/json/coupon.json');
    // Parse the JSON string into a Map
    final Map<String, dynamic> response = jsonDecode(jsonString);
    couponData = List<CouponModel>.from(
      (response['coupons'] ?? []).map(
        (e) => CouponModel.fromJson(e),
      ),
    );
    print(couponData);
    isloading = false;
    update();
  }

  void onSelectCoupon() {}
}
