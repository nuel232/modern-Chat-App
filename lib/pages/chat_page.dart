import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modern_chat_app/components/chat_bubble.dart';
import 'package:modern_chat_app/components/my_textfield.dart';
import 'package:modern_chat_app/services/auth/auth_service.dart';
import 'package:modern_chat_app/services/chat/chat_service.dart';

class ChatPage extends StatelessWidget {
  final String receiverEmail;
  final String receiverID;
  ChatPage({super.key, required this.receiverEmail, required this.receiverID});

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

      //clear the controller
      messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(receiverEmail),
      ),
      body: Column(
        children: [
          //display all messages
          Expanded(child: _buildMessageList()),

          //user input
          _buildUserInput(context),
        ],
      ),
    );
  }

  Widget _buildMessageList() {
    String senderID = authService.getCurrentUser()!.uid;
    return StreamBuilder(
      stream: chatService.getMessages(receiverID, senderID),
      builder: (context, snapshot) {
        //error
        if (snapshot.hasError) {
          return Text('Error');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text('loading');
        }

        return ListView(
          children: snapshot.data!.docs
              .map((doc) => _buildMessageItem(doc, context))
              .toList(),
        );
      },
    );
  }

  Widget _buildMessageItem(DocumentSnapshot doc, BuildContext context) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    //is current user
    bool isCurrentUser = data["senderID"] == authService.getCurrentUser()!.uid;

    //align message to right is the sender is the current sender
    var alignment = isCurrentUser
        ? Alignment.centerRight
        : Alignment.centerLeft;

    return Container(
      alignment: alignment,

      child: ChatBubble(message: data['message'], isCurrentUser: isCurrentUser),
    );
  }

  Widget _buildUserInput(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          Expanded(
            child: MyTextfield(
              controller: messageController,
              hintText: 'Type a Message..',
              obscureText: false,
            ),
          ),

          IconButton(
            onPressed: sendMessage,
            icon: CircleAvatar(
              radius: 25,
              backgroundColor: Theme.of(context).colorScheme.secondary,
              child: Icon(Icons.chevron_right, size: 35),
            ),
          ),
        ],
      ),
    );
  }
}
