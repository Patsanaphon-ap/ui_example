import 'package:flutter/material.dart';
import 'package:presentation/src/ui/widget/my_text.dart';

class CardWidget extends StatelessWidget {
  final String title;
  final String? subtitle;
  final VoidCallback? onTap;
  final String image;
  const CardWidget({
    super.key,
    required this.title,
    this.subtitle,
    required this.image,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(bottom: 12, left: 8, right: 8),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              decoration: BoxDecoration(
                image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.3), // Darkens the image
                    BlendMode.darken,
                  ),
                  fit: BoxFit.cover,
                  image: NetworkImage(image),
                ),
                borderRadius: const BorderRadius.all(Radius.circular(8)),
              ),
              child: Column(
                children: [
                  if (subtitle != null)
                    text18BoldWhite(
                      subtitle ?? '',
                    ),
                  Align(
                    child: text32BoldWhite(title),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
