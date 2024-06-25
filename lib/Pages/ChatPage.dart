import 'package:flutter/material.dart';
import 'package:whatsapp_clone/CustomUi/CustomCard.dart';
import 'package:whatsapp_clone/Screens/SelectContact.dart';

import '../Model/ChatModel.dart';

class Chatpage extends StatefulWidget {
  const Chatpage({super.key, required this.chatModel, required this.sourceChat});
  final List<ChatModel> chatModel;
   final ChatModel sourceChat;

  @override
  State<Chatpage> createState() => _ChatpageState();
}

class _ChatpageState extends State<Chatpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => SelectContact()));
        },
        child: Icon(Icons.chat),
      ),
      body: ListView.builder(
        itemCount: widget.chatModel.length,
        itemBuilder: (BuildContext context, int index) => CustomCard(
          chatModel: widget.chatModel[index], sourceChat: widget.sourceChat,
        ),
      ),
    );
  }
}
