import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/src/controller/cart/cart_controller.dart';
import 'package:presentation/src/ui/widget/my_load_widget.dart';
import 'package:presentation/src/ui/widget/my_page.dart';
import 'package:presentation/src/ui/widget/my_text.dart';

class CartPage extends StatelessWidget {
  CartPage({super.key});
  final CartController cartCtrl = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return MyPage(
      useScroll: false,
      appbarColor: Colors.white,
      appbar: AppBar(
        title: text18Bold('MY CART'),
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back_ios_new_outlined,
          ),
        ),
        actions: [],
      ),
      bottomNavigationBar: _bottomNavigationBar(context),
      child: GetBuilder<CartController>(
        builder: (_) {
          if (cartCtrl.isloading) {
            return Center(
              child: MyLoadingWidget(),
            );
          } else if (cartCtrl.productCart.isEmpty) {
            return Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                        10.0), // Adjust the radius as needed
                    child: Image.asset(
                      'assets/icons/Empty_cart.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                text18Bold('Oops! Your cart is empty'),
              ],
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Widget _bottomNavigationBar(context) {
    return GetBuilder<CartController>(
      builder: (_) {
        if (cartCtrl.isloading || cartCtrl.productCart.isEmpty) {
          return SizedBox();
        }
        return Container(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: MediaQuery.of(context).padding.bottom + 12,
            top: 8,
          ),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24.0),
              topRight: Radius.circular(24.0),
            ),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        Icons.check_outlined,
                      ),
                      label: text18Bold("Check Out"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
