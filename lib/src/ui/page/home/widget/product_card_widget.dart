import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/src/ui/widget/my_text.dart';

class ProductCardWidget extends StatelessWidget {
  final String herotag;
  final String photo;
  final String type;
  final String title;
  final String price;
  final String rating;
  final String commentcount;
  final VoidCallback? onTap;
  const ProductCardWidget(
      {super.key,
      required this.herotag,
      required this.photo,
      required this.type,
      required this.title,
      required this.price,
      required this.rating,
      required this.commentcount,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: (Get.height * 0.15) + 18,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColorLight,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Theme.of(context).primaryColorLight,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Section with Hero animation
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Hero(
                tag: herotag,
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
            // Product Type Text
            text14SmallBlack(
              type,
            ),
            // Product Title with Limited Height and Ellipsis
            Expanded(
              child: text14BoldBlack(
                title,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            // Rating and Comments
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.star_rate_rounded,
                  color: Colors.amber,
                ),
                text12NormalBlack(
                  "${rating} | ${commentcount}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            // Favorite Icon and Price Row
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
                  "\$${price}",
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
