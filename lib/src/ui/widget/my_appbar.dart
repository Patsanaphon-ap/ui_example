import 'package:flutter/material.dart';
import 'package:presentation/src/ui/widget/my_text.dart';

class MyAppbar extends StatelessWidget {
  final String? title;
  final String? subtitle;
  const MyAppbar({super.key, this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                text24Bold(
                  title ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                text16Normal(
                  subtitle ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: .5,
                    color: Theme.of(context).dividerColor,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                ),
                child: const Icon(Icons.search_outlined),
              ),
              const SizedBox(
                width: 12,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).dividerColor,
                    width: .5,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                ),
                child: const Icon(Icons.notifications_outlined),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
