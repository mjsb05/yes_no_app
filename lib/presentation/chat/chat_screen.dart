import 'package:flutter/material.dart';

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
    );
  }
}
