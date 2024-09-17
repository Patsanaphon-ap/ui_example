import 'package:flutter/material.dart';

class MyShareWidget extends StatelessWidget {
  const MyShareWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        // do something
      },
      icon: Icon(
        Icons.share_rounded,
      ),
    );
  }
}
