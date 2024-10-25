import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/src/controller/payment/payment_controller.dart';
import 'package:presentation/src/ui/widget/my_text.dart';

class PayMethodWidget extends StatelessWidget {
  PayMethodWidget(
      {super.key,
      required this.icon,
      required this.title,
      required this.method});
  final IconData icon;
  final String title;
  final PaymentState method;

  final paymentCtrl = Get.find<PaymentController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: paymentCtrl.onPaymentMethod == method
          ? null
          : () {
              paymentCtrl.setPaymentMethod(method: method);
            },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        margin: EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            width: 1,
            color: paymentCtrl.onPaymentMethod == method
                ? (Theme.of(context).brightness == Brightness.light
                    ? Colors.blueAccent
                    : Colors.redAccent)
                : (Theme.of(context).brightness == Brightness.light
                    ? Colors.grey.shade300
                    : Colors.grey.shade700),
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              weight: 34,
            ),
            SizedBox(
              width: 12,
            ),
            Expanded(
              child: text16Bold(
                title,
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
                  color: paymentCtrl.onPaymentMethod == method
                      ? Colors.blue
                      : Colors.grey,
                  width: 2,
                ),
              ),
              child: paymentCtrl.onPaymentMethod == method
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
