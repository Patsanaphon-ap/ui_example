import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/src/controller/profile/profile_controller.dart';
import 'package:presentation/src/ui/widget/my_text.dart';

class LocationWidget extends StatelessWidget {
  LocationWidget({super.key});
  final ProfileController profileCtrl = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        color: Theme.of(context).indicatorColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(
                Icons.location_on_outlined,
                size: 22,
              ),
              const SizedBox(
                width: 12,
              ),
              text18Bold(
                profileCtrl.onSelectAddressProfile.value,
                maxLines: 1,
                overflow: TextOverflow.clip,
              ),
            ],
          ),
          const Icon(
            Icons.chevron_right_rounded,
            size: 24,
          ),
        ],
      ),
    );
  }
}
