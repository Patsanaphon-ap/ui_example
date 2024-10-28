import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/src/controller/profile/profile_controller.dart';
import 'package:presentation/src/ui/widget/my_load_widget.dart';
import 'package:presentation/src/ui/widget/my_page.dart';
import 'package:presentation/src/ui/widget/my_text.dart';

class LocationPage extends StatelessWidget {
  LocationPage({super.key});
  final ProfileController profileCtrl = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return MyPage(
      useScroll: false,
      appbarColor: Colors.white,
      appbar: AppBar(
        title: text18Bold('Location'),
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
      child: GetBuilder<ProfileController>(
        builder: (_) {
          if (profileCtrl.isloading) {
            return Center(
              child: MyLoadingWidget(),
            );
          } else if (profileCtrl.addressData.isEmpty) {
            return Container();
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
                    String data = profileCtrl.addressData[index];
                    return GestureDetector(
                      onTap: () {
                        profileCtrl.onSelectAddressProfile.value = data;
                        Get.back();
                      },
                      child: Card(
                        child: SizedBox(
                          width: 300,
                          height: 100,
                          child: Center(child: Text(data)),
                        ),
                      ),
                    );
                  },
                  itemCount: profileCtrl.addressData.length,
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
