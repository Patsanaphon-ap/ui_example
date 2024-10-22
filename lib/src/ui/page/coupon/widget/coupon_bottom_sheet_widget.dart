import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/src/config/route_path.dart';
import 'package:presentation/src/controller/cart/cart_controller.dart';
import 'package:presentation/src/data/models/coupon_model.dart';
import 'package:presentation/src/ui/page/coupon/widget/coupon_card_widget.dart';
import 'package:presentation/src/ui/widget/my_text.dart';
import 'package:qr_flutter/qr_flutter.dart';

class CouponBottomSheetWidget extends StatelessWidget {
  final CouponModel data;
  const CouponBottomSheetWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CouponCardWidget(
              data: data,
              onPressed: () {
                Get.find<CartController>().onDiscount(
                  coupon: data,
                );
                Get.until((route) => route.settings.name == RoutePath.cart);
              },
            ),
            SizedBox(
              height: 12,
            ),
            Center(
              child: text12Normal(
                'Scan this QR code to get discount during checkout!',
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Center(
              child: QrImageView(
                data: data.code,
                version: QrVersions.auto,
                size: 200.0,
              ),
            ),
            Center(child: Icon(Icons.info_outline)),
            text12Normal(
              'This is a single use code for your use only. Get a new code each time you shop',
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 12,
            ),
          ],
        ),
      ),
    );
  }
}
