import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class TheirMessageBubble extends StatelessWidget {
  final Message message;
  const TheirMessageBubble({super.key, required this.message});

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
            child: Text(
              textAlign: TextAlign.left,
              message.text,
              style: TextStyle(
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.black
                    : Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 5),
          _ImageBubble(response: message),
        ],
      ),
    );
  }
}

// ignore: unused_element
class _ImageBubble extends StatelessWidget {
  final Message response;
  const _ImageBubble({required this.response});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final src = response.text == 'yes'
        ? 'https://yesno.wtf/assets/yes/7-653c8ee5d3a6bbafd759142c9c18d76c.gif'
        : 'https://yesno.wtf/assets/no/14-cb78bf7104f848794808d61b9cd83eba.gif';
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        response.imageUrl ?? src,
        width: size.width * 0.5,
        height: size.height * 0.2,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) =>
            loadingProgress == null
                ? child
                : Container(
                    alignment: Alignment.centerLeft,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    width: size.width * 0.5,
                    height: size.height * 0.2,
                    child: const Text('Wife ❤️ is typing...'),
                  ),
      ),
    );
  }
}
