import 'package:flutter/material.dart';
import 'package:yes_no_app/ui/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/ui/widgets/chat/their_message_bubble.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const Padding(
              padding: EdgeInsets.all(10.0),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/wife.JPG'),
              )),
          centerTitle: false,
          title: const Text('Wife ❤️'),
        ),
        body: _ChatView());
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 8,
                itemBuilder: (context, index) {
                  if (index % 2 == 0) {
                    int newIndex = index ~/ 2;
                    return TheirMessageBubble(idx: newIndex);
                  }
                  return const MyMessageBubble();
                },
              ),
            ),
            const Divider(height: 1),
            // _ChatInput(),
          ],
        ),
      ),
    );
  }
}
