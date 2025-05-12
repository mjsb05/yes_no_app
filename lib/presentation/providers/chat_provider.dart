import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  List<Message> messagesList = [
    Message(text: "Hola Edu", fromWho: FromWho.me),
    Message(text: "te amo", fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {
    if (text.trim().isEmpty) {
      return;
    }
    final newMessage = Message(text: text, fromWho: FromWho.me);
    debugPrint("Flutter: Mensajes de la lista: ${messagesList.length}");

    messagesList.add(newMessage);

    //Notica a provider que algo cambió
    notifyListeners();
    moveScrollToBottom();
  }

//Mover el scroll hasta abajo
  Future<void> moveScrollToBottom() async {
    //animación
    await Future.delayed(const Duration(milliseconds: 100));
    chatScrollController.animateTo(
        //offset: posición del mázimo scroll posible
        chatScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut);
  }
}
