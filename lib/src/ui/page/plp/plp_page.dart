import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/src/config/route_path.dart';
import 'package:presentation/src/controller/plp/plp_controller.dart';
import 'package:presentation/src/ui/page/plp/widget/plp_grid_card_widget.dart';
import 'package:presentation/src/ui/page/plp/widget/plp_list_card_widget.dart';
import 'package:presentation/src/ui/widget/my_load_widget.dart';
import 'package:presentation/src/ui/widget/my_page.dart';
import 'package:presentation/src/ui/widget/my_text.dart';

class PLPPage extends StatelessWidget {
  PLPPage({super.key});
  final PLPController plpCtrl = Get.put(PLPController());
  final GlobalKey<SliverAnimatedListState> _listKey =
      GlobalKey<SliverAnimatedListState>();
  @override
  Widget build(BuildContext context) {
    String title = plpCtrl.title;
    return MyPage(
      useScroll: false,
      appbar: AppBar(
        centerTitle: true,
        surfaceTintColor: Colors.transparent,
        title: text22Bold(
          plpCtrl.title,
        ),
      ),
      child: GetBuilder<PLPController>(
        builder: (_) {
          if (plpCtrl.isloading) {
            return Column(
              children: [
                Expanded(
                  child: Center(
                    child: MyLoadingWidget(),
                  ),
                )
              ],
            );
          }
          return RefreshIndicator(
            onRefresh: () async {},
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: CustomScrollView(
                slivers: [
                  Obx(() => SliverAppBar(
                        leading: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.sort_outlined,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        actions: [
                          IconButton(
                            onPressed: () => plpCtrl.viewtype.value = false,
                            icon: Icon(
                              Icons.list_outlined,
                              color: (!plpCtrl.viewtype.value)
                                  ? Theme.of(context).primaryColor
                                  : Colors.black,
                            ),
                          ),
                          IconButton(
                            onPressed: () => plpCtrl.viewtype.value = true,
                            icon: Icon(
                              Icons.grid_view_outlined,
                              color: (plpCtrl.viewtype.value)
                                  ? Theme.of(context).primaryColor
                                  : Colors.black,
                            ),
                          ),
                        ],
                      )),
                  Obx(
                    () => (plpCtrl.viewtype.value)
                        ? GridViewProduct(title)
                        : ListViewProduct(title),
                  ),
                  SliverPadding(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).padding.bottom + 10,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  SliverAnimatedList ListViewProduct(String title) {
    return SliverAnimatedList(
      key: _listKey,
      initialItemCount: plpCtrl.product.length,
      itemBuilder: (context, index, animation) {
        return SizeTransition(
          sizeFactor: animation,
          child: PLPListCardWidget(
            herotag: "${title}-product-${index}",
            type: plpCtrl.product[index].category,
            title: plpCtrl.product[index].title,
            price: plpCtrl.product[index].price.toString(),
            rating: plpCtrl.product[index].rating.toString(),
            commentcount: plpCtrl.product[index].stock.toString(),
            onTap: () {
              Get.toNamed(
                RoutePath.productdetail,
                arguments: {
                  'herotag': "${title}-product-${index}",
                },
              );
            },
            photo: plpCtrl.product[index].thumbnail,
            description: plpCtrl.product[index].description,
          ),
        );
      },
    );
  }

  SliverAnimatedGrid GridViewProduct(String title) {
    return SliverAnimatedGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 12.0,
        crossAxisSpacing: 12.0,
        crossAxisCount: 2,
        childAspectRatio: .71,
      ),
      initialItemCount: plpCtrl.product.length,
      itemBuilder: (context, index, animation) {
        return SizeTransition(
          sizeFactor: animation,
          child: PLPCardWidget(
            herotag: "${title}-product-${index}",
            type: plpCtrl.product[index].category,
            title: plpCtrl.product[index].title,
            description: plpCtrl.product[index].description,
            price: plpCtrl.product[index].price.toString(),
            rating: plpCtrl.product[index].rating.toString(),
            commentcount: plpCtrl.product[index].stock.toString(),
            onTap: () {
              Get.toNamed(
                RoutePath.productdetail,
                arguments: {
                  'herotag': "${title}-product-${index}",
                },
              );
            },
            photo: plpCtrl.product[index].thumbnail,
          ),
        );
      },
    );
  }
}
