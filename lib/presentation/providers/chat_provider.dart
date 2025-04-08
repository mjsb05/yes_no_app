import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  List<Message> messagesList = [
    Message(text: "Hola Edu", fromWho: FromWho.me),
    Message(text: "te amo", fromWho: FromWho.me),
  ];
}
