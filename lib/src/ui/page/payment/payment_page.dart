import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/src/controller/payment/payment_controller.dart';
import 'package:presentation/src/ui/page/payment/widget/credit_card_widget.dart';
import 'package:presentation/src/ui/page/payment/widget/pay_method_widget.dart';
import 'package:presentation/src/ui/page/payment/widget/promot_pay_widget.dart';
import 'package:presentation/src/ui/widget/my_page.dart';
import 'package:presentation/src/ui/widget/my_text.dart';

class PaymentPage extends StatelessWidget {
  PaymentPage({super.key});

  final paymentCtrl = Get.put(PaymentController());

  @override
  Widget build(BuildContext context) {
    return MyPage(
      popscope: false,
      useScroll: false,
      appbarColor: Colors.white,
      unforcus: true,
      bottomNavigationBar: _bottomNavigationBar(context),
      appbar: AppBar(
        title: text18Bold('Payment Details'),
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
      child: GetBuilder<PaymentController>(
        id: 'method',
        builder: (_) {
          return ListView(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            children: [
              PayMethodWidget(
                icon: Icons.payments_outlined,
                title: 'Cash on Delivery',
                method: PaymentState.cash,
              ),
              PayMethodWidget(
                icon: Icons.savings_outlined,
                title: 'Debit Card',
                method: PaymentState.debit,
              ),
              CreditCardWidget(),
              PromotPayWidget(),
            ],
          );
        },
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
                    paymentCtrl.onPayNow();
                  },
                  child: text18Bold("Pay Now"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
