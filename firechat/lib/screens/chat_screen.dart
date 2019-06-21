import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  static String id = "/chat";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat"),
      ),
      body: Container(
        child: Text("Chat Screen"),
      ),
    );
  }
}
