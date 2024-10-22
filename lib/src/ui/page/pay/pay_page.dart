import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/src/controller/payment/payment_controller.dart';
import 'package:presentation/src/ui/widget/my_load_widget.dart';
import 'package:presentation/src/ui/widget/my_page.dart';
import 'package:presentation/src/ui/widget/my_text.dart';
import 'package:qr_flutter/qr_flutter.dart';

class PayPage extends StatelessWidget {
  const PayPage({super.key});

  @override
  Widget build(BuildContext context) {
    final payCtrl = Get.find<PaymentController>();

    return MyPage(
      useScroll: false,
      appbarColor: Colors.white,
      appbar: AppBar(
        title: text18Bold('Pay'),
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
          if (payCtrl.isloading) {
            return Center(
              child: MyLoadingWidget(),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () => payCtrl.promptPayConfirm(),
                    child: Center(
                      child: QrImageView(
                        data: 'https://www.youtube.com/watch?v=xvFZjo5PgG0',
                        version: QrVersions.auto,
                        size: 200,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Center(
                    child: Icon(Icons.info_outline),
                  ),
                  text12Normal(
                    'This is a single use code for your use only. Get a new code each time you shop',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
