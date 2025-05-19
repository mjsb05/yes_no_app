import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final getYesNoAnswer = GetYesNoAnswer();

  List<Message> messagesList = [];

  Future<void> sendMessage(String text) async {
    if (text.trim().isEmpty) {
      return;
    }
    final newMessage = Message(text: text, fromWho: FromWho.me);
    debugPrint("Flutter: Mensajes de la lista: ${messagesList.length}");

    messagesList.add(newMessage);

    //Detectar si el usuario uso una pregunta
    if (text.endsWith('?')) {
      herReply();
    }

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

  //Crear la respuesta de ella
  Future<void> herReply() async {
    //Obtener el mensaje de la petición http
    final herMessage = await getYesNoAnswer.getAswer();

    //Añadir el mensaje de ella a la lista de mensajes
    messagesList.add(herMessage);

    //Notificar a provider los cambios
    notifyListeners();
    moveScrollToBottom();
  }
}
