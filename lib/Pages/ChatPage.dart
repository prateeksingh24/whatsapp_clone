import 'package:flutter/material.dart';
import 'package:whatsapp_clone/CustomUi/CustomCard.dart';
import 'package:whatsapp_clone/Screens/SelectContact.dart';

import '../Model/ChatModel.dart';

class Chatpage extends StatefulWidget {
  const Chatpage({super.key});

  @override
  State<Chatpage> createState() => _ChatpageState();
}

class _ChatpageState extends State<Chatpage> {
  List<ChatModel> chats = [
    ChatModel(
        name: "Prateek Singh",
        icon: "person.svg",
        currentMessage: "Hi Prateek",
        isGroup: false,
        time: "4:00"),
    ChatModel(
        name: "Abhishek Mishra",
        icon: "person.svg",
        currentMessage: "Hi Abhishek",
        isGroup: false,
        time: "5:00"),
    ChatModel(
        name: "Homies",
        icon: "group.svg",
        currentMessage: "Hi Everyone",
        isGroup: true,
        time: "8:00"),
    ChatModel(
        name: "Aman",
        icon: "person.svg",
        currentMessage: "Hi Aman",
        isGroup: false,
        time: "14:00"),
    ChatModel(
        name: "Saurabh Mishra",
        icon: "person.svg",
        currentMessage: "Hi Saurabh",
        isGroup: false,
        time: "2:00"),
  ];

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
        itemCount: chats.length,
        itemBuilder: (BuildContext context, int index) => CustomCard(
          chatModel: chats[index],
        ),
      ),
    );
  }
}
