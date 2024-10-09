import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/src/config/route_path.dart';
import 'package:presentation/src/controller/cart/cart_controller.dart';
import 'package:presentation/src/data/models/product_detail_model.dart';
import 'package:presentation/src/ui/page/cart/widget/cart_card_widget.dart';
import 'package:presentation/src/ui/page/cart/widget/cart_empty.dart';
import 'package:presentation/src/ui/widget/my_load_widget.dart';
import 'package:presentation/src/ui/widget/my_page.dart';
import 'package:presentation/src/ui/widget/my_text.dart';
import 'package:presentation/src/util/format_util.dart';

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
                _couponWidget(),
                _addressWidget(),
                _summaryWidget(),
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
          onDecrease: () => cartCtrl.onDcreaseQty(index: index),
          onIncrease: () => cartCtrl.onIncreaseQty(index: index),
        );
      },
      itemCount: cartCtrl.productCart.length,
      separatorBuilder: (context, index) => SizedBox(
        height: 12,
      ),
    );
  }

  Widget _couponWidget() {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 12,
      ),
      padding: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: ObxValue(
        (coupon) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              cartCtrl.onSelectCoupon.value.code.isNotEmpty
                  ? 'Coupon Applied: ${cartCtrl.onSelectCoupon.value.code}'
                  : 'Have a coupon code?',
              style: TextStyle(fontSize: 18),
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

  Widget _addressWidget() {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 12,
      ),
      padding: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          value: '123 SV Colony',
          items: [
            DropdownMenuItem<String>(
              value: '123 SV Colony',
              child: text18Normal('123 SV Colony'),
            ),
            DropdownMenuItem<String>(
              value: '456 Elm Street',
              child: text18Normal('456 Elm Street'),
            ),
            DropdownMenuItem<String>(
              value: '789 Oak Avenue',
              child: text18Normal('789 Oak Avenue'),
            ),
          ],
          onChanged: (value) => '123 SV Colony Good',
        ),
      ),
    );
  }

  Widget _summaryWidget() {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 12,
      ),
      padding: EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          text22Bold('Order Summary'),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              text18Normal('Subtotal'),
              text18Normal('\$ ${money.format(cartCtrl.subtotal)}'),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              text18Normal('Delivery'),
              text18Normal('\$ ${money.format(cartCtrl.delivery)}'),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              text18Normal('Discount'),
              text18NormalColor('- \$ ${money.format(cartCtrl.discount)}'),
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              text18Bold('Grand Total'),
              text18Bold(
                '\$ ${money.format(cartCtrl.grandtotal)}',
              ),
            ],
          ),
        ],
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
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 12),
                      ),
                      onPressed: () {},
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
