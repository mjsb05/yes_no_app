import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class MyMessageBubble extends StatelessWidget {
  //variable de la identidad atómica
  final Message message;
  const MyMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
      Container(
        decoration: BoxDecoration(
            color: colors.primary, borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child:
              Text(message.text, style: const TextStyle(color: Colors.white)),
        ),
      ),
      const SizedBox(
        height: 10,
      ),
    ]);
  }
}
