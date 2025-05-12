import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://img.cocdn.co/_image/optimize/https://cdn.crushon.ai/images/84811d31-f4ef-11ee-a680-7af8fb7a565e/d11a128a-fe96-411d-bc5d-51683785f8e3?q=75&w=256'),
          ),
        ),
        title: const Text('Solecito ☀️'),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //le pide que esté pendiente de cambios del provider

    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(children: [
          Expanded(
              child: ListView.builder(
                  itemCount: chatProvider.messagesList.length,
                  itemBuilder: (context, index) {
                    //Instanca que sabrá de quien es el mensaje
                    final message = chatProvider.messagesList[index];

                    //Si el residuo es 0, es de ella, sino es 0 es mio
                    //Más fácil, si es par es de ella, si no, es mío
                    //return
                    return (message.fromWho == FromWho.other)
                        ? const HerMessageBubble()
                        : MyMessageBubble(message: message);
                  })),

          ///Caja de texto
          MessageFieldBox(),
        ]),
      ),
    );
  }
}
