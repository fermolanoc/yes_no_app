import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

  List<Message> messagesList = [];

  Future<void> sendMessage(String text) async {
    if (text.isNotEmpty) {
      messagesList.add(Message(text: text, sender: Sender.me));
      notifyListeners();
      moveScrollToBottom();

      if (text.endsWith('?')) {
        addTheirMessage();
      }
    }
  }

  Future<void> addTheirMessage() async {
    final theirMessage = await getYesNoAnswer.getAnswer();

    await Future.delayed(const Duration(seconds: 1));
    messagesList.add(Message(
        text: theirMessage.text,
        imageUrl: theirMessage.imageUrl,
        sender: Sender.them));
    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));

    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}
