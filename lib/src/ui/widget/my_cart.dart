import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/src/config/route_path.dart';
import 'package:presentation/src/controller/cart/cart_controller.dart';
import 'package:presentation/src/ui/widget/my_text.dart';

class MyCartWidget extends StatelessWidget {
  MyCartWidget({super.key});
  final CartController cartCtrl = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return ObxValue(
      (data) => IconButton(
        onPressed: () {
          Get.toNamed(RoutePath.cart);
        },
        icon: (cartCtrl.count.value > 0)
            ? Badge(
                isLabelVisible: true,
                label: text14Normal(
                  data.toString(),
                ),
                offset: const Offset(4, -8),
                child: Icon(
                  Icons.shopping_cart_outlined,
                ),
              )
            : Icon(
                Icons.shopping_cart_outlined,
              ),
      ),
      cartCtrl.count.obs,
    );
  }
}

class MyCartBoarderWidget extends StatelessWidget {
  MyCartBoarderWidget({super.key});
  final CartController cartCtrl = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return ObxValue(
      (data) => Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).dividerColor,
            width: .5,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: IconButton(
          onPressed: () {
            Get.toNamed(RoutePath.cart);
          },
          icon: (cartCtrl.count.value > 0)
              ? Badge(
                  isLabelVisible: true,
                  label: text14Normal(cartCtrl.count.value.toString()),
                  offset: const Offset(6, -8),
                  child: Icon(
                    Icons.shopping_cart_outlined,
                  ),
                )
              : Icon(
                  Icons.shopping_cart_outlined,
                ),
        ),
      ),
      cartCtrl.count.obs,
    );
  }
}
