import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/src/controller/category/category_controller.dart';
import 'package:presentation/src/ui/page/category/widget/card_widget.dart';
import 'package:presentation/src/ui/widget/my_load_widget.dart';
import 'package:presentation/src/ui/widget/my_page.dart';
import 'package:presentation/src/ui/widget/my_text.dart';

class CategoryPage extends StatelessWidget {
  CategoryPage({super.key});
  final CategoryController categoryCtrl = Get.put(CategoryController());
  @override
  Widget build(BuildContext context) {
    return MyPage(
      useScroll: false,
      appbar: AppBar(
        centerTitle: true,
        surfaceTintColor: Colors.transparent,
        title: text22Bold(
          'Category',
        ),
      ),
      child: GetBuilder<CategoryController>(
        builder: (_) {
          if (categoryCtrl.isloading) {
            return Column(
              children: [
                Center(
                  child: MyLoadingWidget(),
                )
              ],
            );
          }
          return RefreshIndicator(
            onRefresh: () async {},
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).padding.bottom + 40),
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      CardWidget(
                        textalign: Alignment.center,
                        subtitle: 'Discounts',
                        title: 'UP TO 80% OFF',
                        image:
                            'https://images.pexels.com/photos/96627/pexels-photo-96627.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                      ),
                      ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          Alignment alignment;
                          switch (index % 4) {
                            case 0:
                              alignment = Alignment.centerRight; // Left
                              break;
                            case 1:
                              alignment = Alignment.center; // Center
                              break;
                            case 2:
                              alignment = Alignment.centerLeft; // Right
                              break;
                            case 3:
                              alignment = Alignment.center; // Center again
                              break;
                            default:
                              alignment = Alignment.centerLeft; // Fallback
                          }
                          return CardWidget(
                            textalign: alignment,
                            title: categoryCtrl.category[index].type,
                            image: categoryCtrl.category[index].image,
                            onTap: null,
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 2,
                          );
                        },
                        itemCount: categoryCtrl.category.length,
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
