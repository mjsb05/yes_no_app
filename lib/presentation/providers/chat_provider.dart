import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  List<Message> messagesList = [
    Message(text: "Hola Edu", fromWho: FromWho.me),
    Message(text: "te amo", fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {
    final newMessage = Message(text: text, fromWho: FromWho.me);

    messagesList.add(newMessage);

    //Notica a provider que algo cambió
    notifyListeners();
  }
}
