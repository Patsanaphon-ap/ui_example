import 'package:get/get.dart';

class ProfileController extends GetxController {
  RxString onSelectAddressProfile = ''.obs;
  List<String> addressData = [
    '123 SV Colony',
    '456 Elm Street',
    '789 Oak Avenue'
  ];

  @override
  void onInit() {
    onloadData();
    super.onInit();
  }

  onloadData() {
    onSelectAddressProfile.value = addressData.first;
  }
}
