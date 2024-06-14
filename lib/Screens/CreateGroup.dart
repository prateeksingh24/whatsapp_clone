import 'package:flutter/material.dart';
import 'package:whatsapp_clone/CustomUi/AvtarCard.dart';
import 'package:whatsapp_clone/CustomUi/ButtonCard.dart';
import 'package:whatsapp_clone/CustomUi/ContactCard.dart';
import 'package:whatsapp_clone/Model/ChatModel.dart';

class CreateGroup extends StatefulWidget {
  const CreateGroup({super.key});

  @override
  State<CreateGroup> createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
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

  List<ChatModel> groupsMember = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "New Group",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),
              Text(
                "Add participants",
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
          ],
        ),
        body: Stack(children: [
          ListView.builder(
            itemCount: contacts.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return Container(
                  height: groupsMember.length > 0 ? 90 : 10,
                );
              }
              return InkWell(
                onTap: () {
                  if (contacts[index - 1].select == false) {
                    setState(() {
                      contacts[index - 1].select = true;
                      groupsMember.add(contacts[index - 1]);
                    });
                  } else {
                    setState(() {
                      contacts[index - 1].select = false;
                      groupsMember.remove(contacts[index - 1]);
                    });
                  }
                },
                child: ContactCard(
                  contact: contacts[index - 1],
                ),
              );
            },
          ),
          groupsMember.length > 0
              ? Column(
                  children: [
                    Container(
                      height: 75,
                      color: Colors.white,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: contacts.length,
                          itemBuilder: (context, index) {
                            if (contacts[index].select == true) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    groupsMember.remove(contacts[index]);
                                    contacts[index].select = false;
                                  });
                                },
                                child: AvtarCard(
                                  contact: contacts[index],
                                ),
                              );
                            } else {
                              return Container();
                            }
                          }),
                    ),
                    const Divider(
                      thickness: 1,
                    )
                  ],
                )
              : Container()
        ]));
  }
}
