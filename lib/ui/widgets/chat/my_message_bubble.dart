import 'package:flutter/material.dart';

class MyMessageBubble extends StatelessWidget {
  const MyMessageBubble({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    bool isDarkMode = theme.brightness == Brightness.dark;
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
            color: isDarkMode ? colors.onPrimary : colors.secondary,
            borderRadius: BorderRadius.circular(20)),
        child: const Text(
          'Hello, how are you?',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
