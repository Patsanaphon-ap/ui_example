import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/src/controller/cart/cart_controller.dart';
import 'package:presentation/src/controller/coupon/coupon_controller.dart';
import 'package:presentation/src/ui/page/coupon/widget/coupon_bottom_sheet_widget.dart';
import 'package:presentation/src/ui/page/coupon/widget/coupon_card_widget.dart';
import 'package:presentation/src/ui/widget/my_load_widget.dart';
import 'package:presentation/src/ui/widget/my_page.dart';
import 'package:presentation/src/ui/widget/my_text.dart';

class CouponPage extends StatelessWidget {
  CouponPage({super.key});
  final CouponController couponCtrl = Get.put(CouponController());
  @override
  Widget build(BuildContext context) {
    return MyPage(
      useScroll: false,
      appbarColor: Colors.white,
      appbar: AppBar(
        title: text18Bold('Coupon'),
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back_ios_new_outlined,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: text14Bold("Enter Code"),
          ),
        ],
      ),
      child: GetBuilder<CouponController>(
        builder: (_) {
          if (couponCtrl.isloading) {
            return Center(
              child: MyLoadingWidget(),
            );
          }
          if (couponCtrl.couponData.isEmpty) {
            return Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                        10.0), // Adjust the radius as needed
                    child: Image.asset(
                      'assets/icons/gift.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                text18Bold('Oops! Your coupon is empty'),
              ],
            );
          } else {
            return ListView(
              padding: EdgeInsets.symmetric(horizontal: 12),
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              children: [
                ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (_, index) {
                    return CouponCardWidget(
                      data: couponCtrl.couponData[index],
                      onPressed: () {
                        Get.find<CartController>().onDiscount(
                          coupon: couponCtrl.couponData[index],
                        );
                        Get.back();
                      },
                      onTapInfo: () {
                        Get.bottomSheet(
                          CouponBottomSheetWidget(
                            data: couponCtrl.couponData[index],
                          ),
                        );
                      },
                    );
                  },
                  itemCount: couponCtrl.couponData.length,
                  separatorBuilder: (context, index) => SizedBox(
                    height: 12,
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
