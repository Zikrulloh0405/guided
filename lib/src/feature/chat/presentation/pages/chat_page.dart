import 'package:flutter/material.dart';
import 'package:guidist/src/common/styles/text_style.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat"),
      ),
      body: Center(
        child: Text(
          "Chat",
          style: const AppTextStyle().titleLarge,
        ),
      ),
    );
  }
}
