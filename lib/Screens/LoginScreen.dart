import 'package:flutter/material.dart';
import 'package:whatsapp_clone/CustomUi/ButtonCard.dart';
import 'package:whatsapp_clone/Model/ChatModel.dart';
import 'package:whatsapp_clone/Screens/homeScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});


  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late ChatModel sourceChat;
  List<ChatModel> chatmodels = [
    ChatModel(
        name: "Prateek Singh",
        icon: "person.svg",
        currentMessage: "Hi Abhishek",
        isGroup: false,
        time: "4:00",
        id: 1),
    ChatModel(
        name: "Abhishek Mishra",
        icon: "person.svg",
        currentMessage: "Hi Prateek",
        isGroup: false,
        time: "5:00",
        id: 2),
    // ChatModel(
    //     name: "Homies",
    //     icon: "group.svg",
    //     currentMessage: "Hi Everyone",
    //     isGroup: true,
    //     time: "8:00"),
    ChatModel(
        name: "Shivam",
        icon: "person.svg",
        currentMessage: "Hi Saurabh",
        isGroup: false,
        time: "14:00",
        id: 3),
    ChatModel(
        name: "Saurabh Mishra",
        icon: "person.svg",
        currentMessage: "Hi Shivam",
        isGroup: false,
        time: "2:00",
        id: 4),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: chatmodels.length,
          itemBuilder: (context, index) => InkWell(
              onTap: () {
                sourceChat = chatmodels.removeAt(index);
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (builder) => HomeScreen(
                      chatModel: chatmodels, sourceChat: sourceChat,
                    )));
              },
              child: ButtonCard(
                  name: chatmodels[index].name, icon: Icons.person))),
    );
  }
}
