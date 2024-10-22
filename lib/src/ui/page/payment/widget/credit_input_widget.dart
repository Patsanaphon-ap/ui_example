import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:presentation/src/controller/payment/payment_controller.dart';

class CreditInputWidget extends StatelessWidget {
  CreditInputWidget({
    super.key,
  });

  final paymentCtrl = Get.find<PaymentController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 12,
        ),
        TextFormField(
          controller: paymentCtrl.cardNum,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
          ],
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: 'XXXX XXXX XXXX XXXX',
            labelText: 'Card Number',
          ),
          maxLength: 19,
          onChanged: (value) {},
        ),
        // Expiry Date and CVV in a Row
        Row(
          children: [
            // Expiry Date Field
            Expanded(
              child: TextFormField(
                controller: paymentCtrl.cardExpire,
                keyboardType: TextInputType.datetime,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                      RegExp(r'^\d{0,2}/?\d{0,2}')),
                  LengthLimitingTextInputFormatter(5),
                ],
                decoration: InputDecoration(
                  labelText: 'Expiry Date',
                  hintText: 'MM/YY',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null ||
                      !RegExp(r'^(0[1-9]|1[0-2])\/?([0-9]{2})$')
                          .hasMatch(value)) {
                    return 'Enter a valid expiry date (MM/YY)';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(width: 16),

            // CVV Field
            Expanded(
              child: TextFormField(
                controller: paymentCtrl.cardCVV,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(3),
                ],
                decoration: InputDecoration(
                  labelText: 'CVV',
                  hintText: '123',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.length != 3) {
                    return 'Enter a valid 3-digit CVV';
                  }
                  return null;
                },
                obscureText: true,
              ),
            ),
          ],
        ),
        SizedBox(height: 16),
        // Cardholder Name
        TextFormField(
          controller: paymentCtrl.cardHolderName,
          keyboardType: TextInputType.name,
          decoration: InputDecoration(
            labelText: 'Cardholder Name',
            hintText: 'John Doe',
            border: OutlineInputBorder(),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Enter the cardholder\'s name';
            }
            return null;
          },
        ),
      ],
    );
  }
}
