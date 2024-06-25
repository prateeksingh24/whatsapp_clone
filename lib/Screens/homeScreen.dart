import 'package:flutter/material.dart';
import 'package:whatsapp_clone/Model/ChatModel.dart';
import 'package:whatsapp_clone/Pages/CameraPage.dart';
import 'package:whatsapp_clone/Pages/ChatPage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.chatModel, required this.sourceChat});
  final List<ChatModel> chatModel;
  final ChatModel sourceChat;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 4, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Whatsapp Clone"),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          PopupMenuButton<String>(onSelected: (value) {
            print(value);
          }, itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem(
                child: Text("New group"),
                value: "New group",
              ),
              PopupMenuItem(
                child: Text("New broadcast"),
                value: "New broadcast",
              ),
              PopupMenuItem(
                child: Text("Whatsapp web"),
                value: "Whatsapp web",
              ),
              PopupMenuItem(
                child: Text("Starred messages"),
                value: "Starred messages",
              ),
              PopupMenuItem(
                child: Text("Settings"),
                value: "Settings",
              ),
            ];
          })
        ],
        bottom: TabBar(
          indicatorColor: Colors.white,
          controller: _controller,
          tabs: [
            Tab(
              icon: Icon(Icons.camera_alt),
            ),
            Tab(
              text: "CHATS",
            ),
            Tab(
              text: "STATUS",
            ),
            Tab(
              text: "CALLS",
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: [
          CameraPage(),
          Chatpage(
            chatModel: widget.chatModel, sourceChat: widget.sourceChat,
          ),
          Text("Status"),
          Text("Calls"),
        ],
      ),
    );
  }
}
