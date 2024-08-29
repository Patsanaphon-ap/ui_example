import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/src/ui/widget/my_text.dart';

class ProductCardWidget extends StatelessWidget {
  final int index;
  final String photo;
  final VoidCallback? onTap;
  const ProductCardWidget(
      {super.key, required this.index, required this.photo, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: (Get.height * 0.15) + 18,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Hero(
                tag: "flashsalse-${index}",
                child: Container(
                  margin: EdgeInsets.only(bottom: 12),
                  child: Image.network(
                    width: (Get.height * 0.15),
                    height: (Get.height * 0.15) - 20,
                    fit: BoxFit.cover,
                    photo,
                  ),
                ),
              ),
            ),
            text14Small(
              "Camera",
            ),
            Container(
              height: (Get.height * 0.06),
              child: text16Bold(
                "Camera FUJI X-T10",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.star_rate_rounded,
                  color: Colors.amber,
                ),
                text12Normal(
                  "4.9 | 2356",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.favorite_border_outlined,
                  ),
                ),
                text16BoldColor(
                  "\$12.00",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
