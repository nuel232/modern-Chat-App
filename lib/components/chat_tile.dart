import 'package:flutter/material.dart';

class ChatTile extends StatelessWidget {
  final String text;
  final Widget? subtitle;
  const ChatTile({super.key, required this.text, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.person),
      title: Text(text),
      subtitle: subtitle,
    );
  }
}
