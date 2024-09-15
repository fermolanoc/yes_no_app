import 'dart:math';

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
    final random = Random().nextInt(2); // 0 or 1, 0 is no, 1 is yes

    await Future.delayed(const Duration(seconds: 1));
    messagesList
        .add(Message(text: random == 1 ? 'yes' : 'no', sender: Sender.them));
    notifyListeners();
  }
}
