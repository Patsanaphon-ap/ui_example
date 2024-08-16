import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/src/controller/clock/clock_controller.dart';
import 'package:presentation/src/ui/widget/my_text.dart';

class Countedownclock extends StatelessWidget {
  Countedownclock({
    super.key,
  });
  final timerCtrl = Get.find<ClockController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        text16Normal('Closing in: '),
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).padding.right + 45,
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          decoration: BoxDecoration(
            color: Theme.of(context).indicatorColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(4),
            ),
          ),
          child: Obx(
            () {
              return text16Bold(timerCtrl.hr.value);
            },
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).padding.right + 45,
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          decoration: BoxDecoration(
            color: Theme.of(context).indicatorColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(4),
            ),
          ),
          child: Obx(
            () {
              return text16Bold(timerCtrl.min.value);
            },
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).padding.right + 45,
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          decoration: BoxDecoration(
            color: Theme.of(context).indicatorColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(4),
            ),
          ),
          child: Obx(
            () {
              return text16Bold(timerCtrl.sec.value);
            },
          ),
        ),
      ],
    );
  }
}
