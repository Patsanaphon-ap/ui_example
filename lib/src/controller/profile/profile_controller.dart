import 'package:get/get.dart';

class ProfileController extends GetxController {
  bool isloading = true;
  RxString onSelectAddressProfile = ''.obs;
  List<String> addressData = [
    '123 SV Colony',
    '456 Elm Street',
    '789 Oak Avenue'
  ];

  @override
  void onInit() {
    onLoadLocation();
    onloadData();
    super.onInit();
  }

  onLoadLocation() {
    isloading = true;
    update();
    isloading = false;
    update();
  }

  onloadData() {
    onSelectAddressProfile.value = addressData.first;
  }
}
