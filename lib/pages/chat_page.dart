import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController MessageController = TextEditingController();
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: Center(child: Column(children: [])),
    );
  }
}
