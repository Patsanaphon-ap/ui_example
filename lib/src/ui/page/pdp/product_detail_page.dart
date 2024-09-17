import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/src/controller/productdetail/product_detail_controller.dart';
import 'package:presentation/src/ui/widget/my_cart.dart';
import 'package:presentation/src/ui/widget/my_favorite.dart';
import 'package:presentation/src/ui/widget/my_load_widget.dart';
import 'package:presentation/src/ui/widget/my_page.dart';
import 'package:presentation/src/ui/widget/my_share.dart';
import 'package:presentation/src/ui/widget/my_text.dart';
import 'package:presentation/src/util/format_util.dart';

class ProductDetailPage extends StatelessWidget {
  ProductDetailPage({super.key});

  final productDetailCtrl = Get.put(ProductDetailController());

  @override
  Widget build(BuildContext context) {
    return MyPage(
      appbar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back_ios_new_outlined,
          ),
        ),
        actions: [
          MyShareWidget(),
          MyFavoriteWidget(),
          MyCartWidget(),
        ],
      ),
      bottomNavigationBar: _bottomNavigationBar(context),
      child: ListView(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        children: [
          _productImage(),
          GetBuilder<ProductDetailController>(
            builder: (_) {
              if (productDetailCtrl.isloading) {
                return Center(
                  child: MyLoadingWidget(),
                );
              }
              return Column(
                children: [
                  //Type product
                  _productType(),
                  //Type title
                  _productName(),
                  //Type description
                  _productDescription(),
                  //Type Rating
                  _productRating(),
                  //Type Detail
                  _productDetail(),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _row({Widget? child, double? height, Color? color}) {
    return Container(
      color: color,
      margin: const EdgeInsets.only(left: 16, right: 16, bottom: 10),
      child: SizedBox(
        height: height,
        child: child,
      ),
    );
  }

  Widget _productImage() {
    return Builder(
      builder: (context) {
        if (Get.arguments['herotag'] != null)
          return Hero(
            tag: Get.arguments['herotag'],
            child: Container(
              margin: EdgeInsets.only(
                bottom: 12,
              ),
              child: Image.network(
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
                Get.arguments['image'],
              ),
            ),
          );
        return Image.network(
          width: double.infinity,
          fit: BoxFit.cover,
          'https://images.pexels.com/photos/90946/pexels-photo-90946.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
        );
      },
    );
  }

  Widget _bottomNavigationBar(context) {
    return GetBuilder<ProductDetailController>(
      builder: (_) {
        if (productDetailCtrl.isloading) {
          return SizedBox();
        }
        return Container(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: MediaQuery.of(context).padding.bottom + 12,
            top: 8,
          ),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24.0),
              topRight: Radius.circular(24.0),
            ),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              text14Normal("Total Price"),
                              text22BoldGreen(
                                '\$${money.format(productDetailCtrl.product.price)}',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.add_shopping_cart_outlined,
                    ),
                    label: text18Bold("Add to Cart"),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _productType() {
    return _row(
      child: Row(
        children: [
          Icon(
            Icons.inventory_2_outlined,
          ),
          SizedBox(
            width: 6,
          ),
          text14Normal(
            productDetailCtrl.product.category,
          ),
        ],
      ),
    );
  }

  Widget _productName() {
    return _row(
      child: Row(
        children: [
          Expanded(
            child: text18Bold(
              productDetailCtrl.product.title,
            ),
          ),
        ],
      ),
    );
  }

  Widget _productDescription() {
    return _row(
      child: Row(
        children: [
          Expanded(
            child: text14Normal(
              productDetailCtrl.product.description,
            ),
          ),
        ],
      ),
    );
  }

  Widget _productRating() {
    return _row(
      child: Row(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.star_rate_rounded,
                  color: Colors.amber,
                ),
                text14Normal(
                  '${productDetailCtrl.product.rating} Ratings',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          text14Normal(' | '),
          Expanded(
            child: text14Normal(
              '${productDetailCtrl.product.comment} Reviews',
              textAlign: TextAlign.center,
            ),
          ),
          text14Normal(' | '),
          Expanded(
            child: text14Normal(
              '${productDetailCtrl.product.stock} In Stock',
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _productDetail() {
    return _row(
      child: Column(
        children: [
          TabBar(
            controller: productDetailCtrl.tabcontroller,
            tabs: [
              Tab(
                child: text18Bold('About Item'),
              ),
              Tab(
                child: text18Bold('Reviews'),
              ),
            ],
          ),
          Container(
            height: 300,
            child: TabBarView(
              controller: productDetailCtrl.tabcontroller,
              children: [
                _aboutItem(),
                ListView.separated(
                  itemCount: productDetailCtrl.product.reviews?.length ?? 0,
                  shrinkWrap: true,
                  separatorBuilder: (_, index) {
                    return Divider();
                  },
                  itemBuilder: (_, index) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            text18Bold(
                              productDetailCtrl
                                      .product.reviews?[index].username ??
                                  '',
                            ),
                          ],
                        ),
                        text16Normal(
                          productDetailCtrl.product.reviews?[index].comment ??
                              '',
                          maxLines: 3,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.star_rate_rounded,
                              color: Colors.amber,
                            ),
                            text14Normal(
                              '${productDetailCtrl.product.reviews?[index].rating} Ratings',
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Table _aboutItem() {
    return Table(
      border: TableBorder(bottom: BorderSide(), horizontalInside: BorderSide()),
      defaultVerticalAlignment: TableCellVerticalAlignment.top,
      children: [
        TableRow(
          children: [
            text16Bold('Material'),
            text16Normal(productDetailCtrl.product.specifications!.material),
          ],
        ),
        TableRow(
          children: [
            text16Bold('Color'),
            text16Normal(productDetailCtrl.product.specifications!.color),
          ],
        ),
        TableRow(
          children: [
            text16Bold('Weight'),
            text16Normal(productDetailCtrl.product.specifications!.weight),
          ],
        ),
        TableRow(
          children: [
            text16Bold('Dimensions'),
            text16Normal(
              'Height: ${productDetailCtrl.product.specifications?.dimensions?.height}, '
              'Width: ${productDetailCtrl.product.specifications?.dimensions?.width}, '
              'Depth: ${productDetailCtrl.product.specifications?.dimensions?.depth}',
            ),
          ],
        ),
        TableRow(
          children: [
            text16Bold('Features'),
            text16Normal(
              productDetailCtrl.product.specifications!.features!.join(', '),
            ),
          ],
        ),
      ],
    );
  }
}
