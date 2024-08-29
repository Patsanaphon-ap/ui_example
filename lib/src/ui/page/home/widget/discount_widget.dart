import 'package:flutter/material.dart';
import 'package:presentation/src/ui/widget/my_button.dart';
import 'package:presentation/src/ui/widget/my_text.dart';

class DiscountWidget extends StatelessWidget {
  const DiscountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
                image: AssetImage(
                  "assets/images/mocks/bg_bird.jpg",
                ),
                fit: BoxFit.cover,
              ),
              border: Border(
                  bottom: BorderSide(color: Theme.of(context).dividerColor)),
              borderRadius: const BorderRadius.all(Radius.circular(8)),
            ),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    text18Bold(
                      'Discounts',
                    ),
                    text32BoldWhite(
                      '80% OFF',
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const MyButton(
                      title: 'Check this out',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
