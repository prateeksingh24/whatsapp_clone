import 'package:flutter/material.dart';
import 'package:whatsapp_clone/CustomUi/ButtonCard.dart';
import 'package:whatsapp_clone/CustomUi/ContactCard.dart';
import 'package:whatsapp_clone/Model/ChatModel.dart';
import 'package:whatsapp_clone/Screens/CreateGroup.dart';

class SelectContact extends StatefulWidget {
  const SelectContact({super.key});

  @override
  State<SelectContact> createState() => _SelectContactState();
}

class _SelectContactState extends State<SelectContact> {
  @override
  Widget build(BuildContext context) {
    List<ChatModel> contacts = [
      ChatModel(
          name: "Prateek Singh",
          icon: "",
          currentMessage: "",
          time: "",
          status: "A Full stack Flutter devloper"),
      ChatModel(
          name: "Abhishek",
          icon: "",
          currentMessage: "",
          time: "",
          status: "CTO Of Wipeduck"),
      ChatModel(
          name: "Shobit",
          icon: "",
          currentMessage: "",
          time: "",
          status: "Flutter devloper"),
      ChatModel(
          name: "Prateek Singh",
          icon: "",
          currentMessage: "",
          time: "",
          status: "A Full stack Flutter devloper"),
      ChatModel(
          name: "Abhishek",
          icon: "",
          currentMessage: "",
          time: "",
          status: "CTO Of Wipeduck"),
      ChatModel(
          name: "Shobit",
          icon: "",
          currentMessage: "",
          time: "",
          status: "Flutter devloper"),
      ChatModel(
          name: "Prateek Singh",
          icon: "",
          currentMessage: "",
          time: "",
          status: "A Full stack Flutter devloper"),
      ChatModel(
          name: "Abhishek",
          icon: "",
          currentMessage: "",
          time: "",
          status: "CTO Of Wipeduck"),
      ChatModel(
          name: "Shobit",
          icon: "",
          currentMessage: "",
          time: "",
          status: "Flutter devloper"),
      ChatModel(
          name: "Prateek Singh",
          icon: "",
          currentMessage: "",
          time: "",
          status: "A Full stack Flutter devloper"),
      ChatModel(
          name: "Abhishek",
          icon: "",
          currentMessage: "",
          time: "",
          status: "CTO Of Wipeduck"),
      ChatModel(
          name: "Shobit",
          icon: "",
          currentMessage: "",
          time: "",
          status: "Flutter devloper"),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select Contact",
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            ),
            Text(
              "269 Contacts",
              style: TextStyle(fontSize: 13),
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                size: 26,
              )),
          PopupMenuButton<String>(onSelected: (value) {
            print(value);
          }, itemBuilder: (BuildContext context) {
            return [
              const PopupMenuItem(
                value: "Invite a Friend",
                child: Text("Invite a Friend"),
              ),
              const PopupMenuItem(
                value: "Contacts",
                child: Text("Contacts"),
              ),
              const PopupMenuItem(
                value: "Refresh",
                child: Text("Refresh"),
              ),
              const PopupMenuItem(
                value: "Help",
                child: Text("Help"),
              ),
            ];
          })
        ],
      ),
      body: ListView.builder(
        itemCount: contacts.length + 2,
        itemBuilder: (context, index) {
          if (index == 0) {
            return InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (builder) => CreateGroup()));
              },
              child: ButtonCard(
                name: 'New group',
                icon: Icons.group,
              ),
            );
          } else if (index == 1) {
            return ButtonCard(
              name: 'New group',
              icon: Icons.person_add,
            );
          }
          return ContactCard(
            contact: contacts[index - 2],
          );
        },
      ),
    );
  }
}
