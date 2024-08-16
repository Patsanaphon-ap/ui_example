import 'package:flutter/material.dart';
import 'package:presentation/src/ui/widget/my_text.dart';

class MyButton extends StatelessWidget {
  final String title;
  const MyButton({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: text18Normal(title),
    );
  }
}

class MyButtonFade extends StatefulWidget {
  const MyButtonFade({super.key});

  @override
  State<MyButtonFade> createState() => _MyButtonFadeState();
}

class _MyButtonFadeState extends State<MyButtonFade> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        overlayColor: Colors.white,
        backgroundBuilder:
            (BuildContext context, Set<WidgetState> states, Widget? child) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            child: child,
          );
        },
      ).copyWith(
        side: WidgetStateProperty.resolveWith<BorderSide?>(
            (Set<WidgetState> states) {
          if (states.contains(WidgetState.hovered)) {
            return const BorderSide(width: 3, color: Colors.blue);
          }
          return null; // defer to the default
        }),
      ),
      child: const Text('TextButton #7'),
    );
  }
}
