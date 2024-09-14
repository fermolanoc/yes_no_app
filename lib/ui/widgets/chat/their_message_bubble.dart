import 'package:flutter/material.dart';

class TheirMessageBubble extends StatelessWidget {
  final int idx;
  const TheirMessageBubble({super.key, required this.idx});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
                color: colors.primary, borderRadius: BorderRadius.circular(20)),
            child: const Text(
              textAlign: TextAlign.left,
              'Hello, how are you?',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 10),
          _ImageBubble(index: idx),
        ],
      ),
    );
  }
}

// ignore: unused_element
class _ImageBubble extends StatelessWidget {
  final int index;
  const _ImageBubble({required this.index});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final src = index % 2 == 0
        ? 'https://yesno.wtf/assets/yes/15-3d723ea13af91839a671d4791fc53dcc.gif'
        : 'https://yesno.wtf/assets/no/14-cb78bf7104f848794808d61b9cd83eba.gif';
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        src,
        width: size.width * 0.5,
        height: size.height * 0.2,
        fit: BoxFit.cover,
      ),
    );
  }
}
