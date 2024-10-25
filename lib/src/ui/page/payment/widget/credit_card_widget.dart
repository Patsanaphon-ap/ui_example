import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/src/controller/payment/payment_controller.dart';
import 'package:presentation/src/ui/page/payment/widget/credit_input_widget.dart';
import 'package:presentation/src/ui/widget/my_text.dart';

class CreditCardWidget extends StatelessWidget {
  CreditCardWidget({super.key});
  final paymentCtrl = Get.find<PaymentController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: paymentCtrl.onPaymentMethod == PaymentState.credit
          ? null
          : () {
              paymentCtrl.setPaymentMethod(method: PaymentState.credit);
            },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        margin: EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
            color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              width: 1,
              color: paymentCtrl.onPaymentMethod == PaymentState.credit
                  ? (Theme.of(context).brightness == Brightness.light
                      ? Colors.blueAccent
                      : Colors.redAccent)
                  : (Theme.of(context).brightness == Brightness.light
                      ? Colors.grey.shade300
                      : Colors.grey.shade700),
            )),
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.credit_card_outlined,
                  weight: 34,
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: text16Bold(
                    'Credit Cards',
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
                      color: paymentCtrl.onPaymentMethod == PaymentState.credit
                          ? Colors.blue
                          : Colors.grey,
                      width: 2,
                    ),
                  ),
                  child: paymentCtrl.onPaymentMethod == PaymentState.credit
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
            Builder(builder: (context) {
              if (paymentCtrl.onPaymentMethod == PaymentState.credit) {
                return CreditInputWidget();
              } else {
                return Container();
              }
            }),
          ],
        ),
      ),
    );
  }
}
