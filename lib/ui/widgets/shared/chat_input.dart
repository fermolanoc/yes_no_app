import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/ui/providers/chat_provider.dart';

class ChatInput extends StatelessWidget {
  const ChatInput({super.key});

  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();
    final textController = TextEditingController();
    final FocusNode focusNode = FocusNode();

    final outlineInputBorder = UnderlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(
          color: Colors.transparent,
        ));

    final inputDecoration = InputDecoration(
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      filled: true,
      hintText: 'Type a message',
      suffixIcon: IconButton(
        icon: const Icon(Icons.send),
        onPressed: () {
          final textValue = textController.text;
          chatProvider.sendMessage(textValue);
          textController.clear();
        },
      ),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: TextFormField(
        focusNode: focusNode,
        controller: textController,
        decoration: inputDecoration,
        onFieldSubmitted: (value) {
          chatProvider.sendMessage(value);
          textController.clear();
          focusNode.requestFocus();
        },
        onTapOutside: (event) {
          focusNode.unfocus();
        },
      ),
    );
  }
}
