import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/src/controller/payment/payment_controller.dart';
import 'package:presentation/src/ui/page/payment/widget/credit_input_widget.dart';
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
        builder: (_) {
          return Obx(() => ListView(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                children: [
                  _cashondeliveryWidget(),
                  _debitCardWidget(),
                  _creditCardWidget(),
                  _promotPayWidget(),
                ],
              ));
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

  Widget _cashondeliveryWidget() {
    return GestureDetector(
      onTap: paymentCtrl.onPaymentMethod == PaymentState.cash
          ? null
          : () {
              paymentCtrl.setPaymentMethod(method: PaymentState.cash);
            },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        margin: EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: paymentCtrl.onPaymentMethod == PaymentState.cash
              ? Border.all(
                  width: 1,
                  color: Colors.black,
                )
              : Border.all(
                  width: 1,
                  color: Colors.white,
                ),
        ),
        child: Row(
          children: [
            Icon(
              Icons.payments_outlined,
              weight: 34,
            ),
            SizedBox(
              width: 12,
            ),
            Expanded(
              child: text16Bold(
                'Cash on Delivery',
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
                  color: paymentCtrl.onPaymentMethod == PaymentState.cash
                      ? Colors.blue
                      : Colors.grey,
                  width: 2,
                ),
              ),
              child: paymentCtrl.onPaymentMethod == PaymentState.cash
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

  Widget _debitCardWidget() {
    return GestureDetector(
      onTap: paymentCtrl.onPaymentMethod == PaymentState.debit
          ? null
          : () {
              paymentCtrl.setPaymentMethod(method: PaymentState.debit);
            },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        margin: EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: paymentCtrl.onPaymentMethod == PaymentState.debit
              ? Border.all(
                  width: 1,
                  color: Colors.black,
                )
              : Border.all(
                  width: 1,
                  color: Colors.white,
                ),
        ),
        child: Row(
          children: [
            Icon(
              Icons.savings_outlined,
              weight: 34,
            ),
            SizedBox(
              width: 12,
            ),
            Expanded(
              child: text16Bold(
                'Debit Cards',
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
                  color: paymentCtrl.onPaymentMethod == PaymentState.debit
                      ? Colors.blue
                      : Colors.grey,
                  width: 2,
                ),
              ),
              child: paymentCtrl.onPaymentMethod == PaymentState.debit
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

  Widget _creditCardWidget() {
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
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: paymentCtrl.onPaymentMethod == PaymentState.credit
              ? Border.all(
                  width: 1,
                  color: Colors.black,
                )
              : Border.all(
                  width: 1,
                  color: Colors.white,
                ),
        ),
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

  Widget _promotPayWidget() {
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
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: paymentCtrl.onPaymentMethod == PaymentState.promotPay
              ? Border.all(
                  width: 1,
                  color: Colors.black,
                )
              : Border.all(
                  width: 1,
                  color: Colors.white,
                ),
        ),
        child: Row(
          children: [
            Image.asset(
              'assets/icons/promot_pay.png',
              height: 34,
              fit: BoxFit.fill,
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
