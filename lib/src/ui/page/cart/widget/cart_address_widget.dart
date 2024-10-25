import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/src/controller/cart/cart_controller.dart';
import 'package:presentation/src/controller/profile/profile_controller.dart';
import 'package:presentation/src/ui/widget/my_text.dart';

class CartAddressWidget extends StatelessWidget {
  final CartController cartCtrl = Get.find<CartController>();
  final ProfileController profileCtrl = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 12,
      ),
      padding: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Obx(() => DropdownButtonHideUnderline(
            child: DropdownButton(
              isExpanded: true,
              value: cartCtrl.onSelectAddress.value,
              items: profileCtrl.addressData.map((address) {
                return DropdownMenuItem<String>(
                  value: address,
                  child: text14Normal(
                    address,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                );
              }).toList(),
              onChanged: (value) => cartCtrl.onSelectAddress.value =
                  value ?? profileCtrl.onSelectAddressProfile.value,
            ),
          )),
    );
  }
}
