import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:presentation/src/ui/widget/my_text.dart';

class PLPCardWidget extends StatelessWidget {
  final String herotag;
  final String photo;
  final String type;
  final String title;
  final String description;
  final String price;
  final String rating;
  final String commentcount;
  final VoidCallback? onTap;
  const PLPCardWidget({
    super.key,
    required this.herotag,
    required this.photo,
    required this.type,
    required this.title,
    required this.description,
    required this.price,
    required this.rating,
    required this.commentcount,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
                tag: herotag,
                child: Container(
                  margin: EdgeInsets.only(bottom: 12),
                  child: Image.network(
                    width: (Get.width),
                    height: (Get.height * 0.15) - 20,
                    fit: BoxFit.cover,
                    photo,
                  ),
                ),
              ),
            ),
            text14Small(
              type,
            ),
            Container(
              child: text14Bold(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Container(
              child: text12Normal(
                description,
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
                  "${rating} | ${commentcount}",
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
