import 'dart:async';

import 'package:get/get.dart';

class ClockController extends GetxController {
  Timer? _timer;
  int remainSeconds = 1;

  final hr = ''.obs;
  final min = ''.obs;
  final sec = ''.obs;

  @override
  void onInit() async {
    DateTime currentTime = DateTime.now();
    DateTime start = currentTime.copyWith(hour: 10, minute: 0);
    DateTime end = currentTime.copyWith(hour: 16, minute: 0);
    final length = end.difference(start);
    final difference = end.difference(currentTime);

    if (length.inSeconds < difference.inSeconds ||
        difference.inSeconds.isNegative) {
      cancel();
    } else {
      _startTimer(difference.inSeconds);
    }
    super.onInit();
  }

  void cancel() {
    if (_timer != null) _timer!.cancel();
    hr.value = '00';
    min.value = '00';
    sec.value = '00';
  }

  _startTimer(int seconds) {
    const duration = Duration(seconds: 1);
    remainSeconds = seconds;
    _timer = Timer.periodic(duration, (Timer timer) {
      if (remainSeconds == 0) {
        hr.value = '00';
        min.value = '00';
        sec.value = '00';

        timer.cancel();
      } else {
        int hour = remainSeconds ~/ 3600;
        int minutes = (remainSeconds ~/ 60) % 60;
        int seconds = remainSeconds % 60;
        hr.value = hour.toString().padLeft(2, "0");
        min.value = minutes.toString().padLeft(2, "0");
        sec.value = seconds.toString().padLeft(2, "0");
        remainSeconds--;
      }
    });
  }
}
