import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/src/config/route_path.dart';
import 'package:presentation/src/controller/cart/cart_controller.dart';
import 'package:presentation/src/data/models/product_detail_model.dart';
import 'package:presentation/src/ui/page/cart/widget/cart_address_widget.dart';
import 'package:presentation/src/ui/page/cart/widget/cart_card_widget.dart';
import 'package:presentation/src/ui/page/cart/widget/cart_coupon_widget.dart';
import 'package:presentation/src/ui/page/cart/widget/cart_empty.dart';
import 'package:presentation/src/ui/page/cart/widget/cart_summary_widget.dart';
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
        title: text18Bold('My Cart'),
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
            return CartEmpty();
          } else {
            return ListView(
              padding: EdgeInsets.symmetric(horizontal: 12),
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              children: [
                _productWidget(),
                CartCouponWidget(),
                CartAddressWidget(),
                CartSummaryWidget(),
              ],
            );
          }
        },
      ),
    );
  }

  Widget _productWidget() {
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (_, index) {
        ProductModel data = cartCtrl.productCart[index];
        return CartCardWidget(
          data: data,
          onDelete: () => cartCtrl.onDeleteProduct(productDelete: data),
          onDecrease: () => cartCtrl.onDecreaseQty(index: index),
          onIncrease: () => cartCtrl.onIncreaseQty(index: index),
        );
      },
      itemCount: cartCtrl.productCart.length,
      separatorBuilder: (context, index) => SizedBox(
        height: 12,
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
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24.0),
              topRight: Radius.circular(24.0),
            ),
            color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 12),
                      ),
                      onPressed: () {
                        Get.toNamed(RoutePath.payment);
                      },
                      child: text18Bold("Proceed to checkout"),
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
