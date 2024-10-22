import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/src/config/route_path.dart';
import 'package:presentation/src/controller/cart/cart_controller.dart';
import 'package:presentation/src/controller/payment/payment_controller.dart';
import 'package:presentation/src/ui/page/thanks/widget/thanks_card_widget.dart';
import 'package:presentation/src/ui/widget/my_page.dart';
import 'package:presentation/src/ui/widget/my_text.dart';

class ThankePage extends StatelessWidget {
  ThankePage({super.key});
  final payCtrl = Get.find<PaymentController>();
  final cartCtrl = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return MyPage(
      useScroll: false,
      appbarColor: Colors.white,
      bottomNavigationBar: _bottomNavigationBar(context),
      appbar: AppBar(
        leading: InkWell(
          onTap: () {
            cartCtrl.onClearCart();
            Get.offNamedUntil(RoutePath.bottomnav, (route) => false);
          },
          child: Icon(
            Icons.arrow_back_ios_new_outlined,
          ),
        ),
        actions: [],
      ),
      child: GetBuilder<PaymentController>(
        builder: (_) {
          return ListView(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            children: [
              _orderConfirm(),
              _orderDetail(),
              _orderAddress(),
            ],
          );
        },
      ),
    );
  }

  Widget _orderAddress() {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          text18Bold(
            'Your Order is being Shipped At',
          ),
          text14Normal(
            payCtrl.addressShipping,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _orderDetail() {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ThanksCardWidget(
                data: payCtrl.productCart[index],
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                height: 12,
              );
            },
            itemCount: payCtrl.productCart.length,
          ),
        ],
      ),
    );
  }

  Widget _bottomNavigationBar(context) {
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
                  onPressed: () {
                    cartCtrl.onClearCart();
                    Get.offAllNamed(RoutePath.bottomnav);
                  },
                  child: text18Bold("Confirm"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _orderConfirm() {
    return Column(
      children: [
        Icon(
          Icons.check_circle_outline_rounded,
          color: Colors.green,
          size: 52,
        ),
        Center(
          child: text24Bold('Order Confirmed'),
        ),
        SizedBox(
          height: 18,
        )
      ],
    );
  }
}
