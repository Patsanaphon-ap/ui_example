import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/src/config/route_path.dart';
import 'package:presentation/src/controller/cart/cart_controller.dart';
import 'package:presentation/src/ui/widget/my_text.dart';

class CartCouponWidget extends StatelessWidget {
  final CartController cartCtrl = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 12,
      ),
      padding: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: ObxValue(
        (coupon) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            text14Normal(
              cartCtrl.onSelectCoupon.value.code.isNotEmpty
                  ? 'Coupon Applied: ${cartCtrl.onSelectCoupon.value.code}'
                  : 'Have a coupon code?',
            ),
            TextButton(
              onPressed: () {
                Get.toNamed(RoutePath.coupon);
              },
              child: text18Normal('Apply'),
            ),
          ],
        ),
        cartCtrl.onSelectCoupon.obs,
      ),
    );
  }
}
