import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  List<Message> messagesList = [];

  Future<void> sendMessage(String text) async {
    if (text.isNotEmpty) {
      messagesList.add(Message(text: text, sender: Sender.me));
      notifyListeners();

      if (text.endsWith('?')) {
        addTheirMessage();
      }
    }
  }

  Future<void> addTheirMessage() async {
    final random =
        (1 + (2 - 1) * (DateTime.now().millisecondsSinceEpoch % 2)).toInt();

    await Future.delayed(const Duration(seconds: 1));
    messagesList
        .add(Message(text: random == 1 ? 'yes' : 'no', sender: Sender.them));
    notifyListeners();
  }
}
