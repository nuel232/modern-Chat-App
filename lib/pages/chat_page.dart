import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  final String receiverEmail;
  const ChatPage({super.key, required this.receiverEmail});

  @override
  Widget build(BuildContext context) {
    final TextEditingController MessageController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(receiverEmail),
      ),
      body: Center(child: Column(children: [])),
    );
  }
}
