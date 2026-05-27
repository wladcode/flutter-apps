

import 'package:flutter/material.dart';
import 'package:hello_world_app/config/helpers/get_yes_no_answer.dart';
import 'package:hello_world_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController scrollController = ScrollController();
  final GetYesNoAnswer _getYesNoAnswer = GetYesNoAnswer();
  List<Message> messages = [
    Message(text: 'Hello', fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;
    final newMessage = Message(text: text, fromWho: FromWho.me);
    messages.add(newMessage);
    notifyListeners();
    await moveScrollToBottom();
    await herReply(newMessage.text);
  }

  Future<void> herReply(String message) async {
    try {
      Message response = Message(text: 'lorem ipsum dolor sit amet', imageUrl: null, fromWho: FromWho.her);

      if (message.contains('?')) {
        response = await _getYesNoAnswer.getAnswer();
      }
      messages.add(response);
      notifyListeners();
      await moveScrollToBottom();
    } catch (e) {
      Message errorMessage = Message(text: 'Sorry, something went wrong', fromWho: FromWho.her);
      messages.add(errorMessage);
      notifyListeners();
      await moveScrollToBottom();
    }
  }



  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}