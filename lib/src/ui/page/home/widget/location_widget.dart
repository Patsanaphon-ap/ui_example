import 'package:flutter/material.dart';
import 'package:presentation/src/ui/widget/my_text.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        color: Theme.of(context).indicatorColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(
                Icons.location_on_outlined,
                size: 22,
              ),
              const SizedBox(
                width: 12,
              ),
              text22Bold(
                'Location',
                maxLines: 1,
                overflow: TextOverflow.clip,
              ),
            ],
          ),
          const Icon(
            Icons.chevron_right_rounded,
            size: 24,
          ),
        ],
      ),
    );
  }
}
