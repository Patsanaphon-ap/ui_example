import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/src/controller/payment/payment_controller.dart';
import 'package:presentation/src/ui/widget/my_text.dart';

class PromotPayWidget extends StatelessWidget {
  PromotPayWidget({super.key});

  final paymentCtrl = Get.find<PaymentController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: paymentCtrl.onPaymentMethod == PaymentState.promotPay
          ? null
          : () {
              paymentCtrl.setPaymentMethod(method: PaymentState.promotPay);
            },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        margin: EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
            color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              width: 1,
              color: paymentCtrl.onPaymentMethod == PaymentState.promotPay
                  ? (Theme.of(context).brightness == Brightness.light
                      ? Colors.blueAccent
                      : Colors.redAccent)
                  : (Theme.of(context).brightness == Brightness.light
                      ? Colors.grey.shade300
                      : Colors.grey.shade700),
            )),
        child: Row(
          children: [
            Image.asset(
              'assets/icons/promot_pay.png',
              height: 34,
              fit: BoxFit.fill,
            ),
            SizedBox(
              width: 6,
            ),
            Expanded(
              flex: 6,
              child: text16Bold(
                'Prompt Pay',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Container(
              width: 24,
              height: 24,
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: paymentCtrl.onPaymentMethod == PaymentState.promotPay
                      ? Colors.blue
                      : Colors.grey,
                  width: 2,
                ),
              ),
              child: paymentCtrl.onPaymentMethod == PaymentState.promotPay
                  ? Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
