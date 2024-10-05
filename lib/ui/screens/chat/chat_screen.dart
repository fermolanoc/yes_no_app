import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/ui/providers/chat_provider.dart';
import 'package:yes_no_app/ui/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/ui/widgets/chat/their_message_bubble.dart';
import 'package:yes_no_app/ui/widgets/shared/chat_input.dart';

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
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: chatProvider.chatScrollController,
                itemCount: chatProvider.messagesList.length,
                itemBuilder: (context, index) {
                  final message = chatProvider.messagesList[index];
                  if (message.sender == Sender.them) {
                    return TheirMessageBubble(message: message);
                  }
                  return MyMessageBubble(message: message);
                },
              ),
            ),
            const Divider(height: 1),
            const ChatInput(),
          ],
        ),
      ),
    );
  }
}
