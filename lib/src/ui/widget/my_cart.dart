import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/src/controller/cart/cart_controller.dart';
import 'package:presentation/src/ui/widget/my_text.dart';

class MyCartWidget extends StatelessWidget {
  MyCartWidget({super.key});
  final CartController cartCtrl = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      builder: (_) {
        return IconButton(
          onPressed: () {
            // do something
          },
          icon: Badge(
            isLabelVisible: true,
            label: text14Normal("2"),
            offset: const Offset(4, -8),
            child: Icon(
              Icons.shopping_cart_outlined,
            ),
          ),
        );
      },
    );
  }
}
