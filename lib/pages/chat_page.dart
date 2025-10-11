import 'package:flutter/material.dart';
import 'package:modern_chat_app/services/auth/auth_service.dart';
import 'package:modern_chat_app/services/chat/chat_service.dart';

class ChatPage extends StatelessWidget {
  final String receiverEmail;
  final String receiverID;
  const ChatPage({
    super.key,
    required this.receiverEmail,
    required this.receiverID,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController messageController = TextEditingController();

    // chat & auth Service
    final AuthService authService = AuthService();
    final ChatService chatService = ChatService();

    //send message
    void sendMessage() async {
      //if the message is has data
      if (messageController.text.isNotEmpty) {
        //send message
        await chatService.sendMessage(receiverID, messageController.text);
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(receiverEmail),
      ),
      body: Center(child: Column(children: [])),
    );
  }
}
