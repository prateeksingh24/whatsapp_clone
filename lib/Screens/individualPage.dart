import 'dart:io';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:whatsapp_clone/CustomUi/OwnMeassageCard.dart';
import 'package:whatsapp_clone/CustomUi/ReplyCard.dart';

import '../Model/ChatModel.dart';

class IndividualPage extends StatefulWidget {
  const IndividualPage(
      {super.key, required this.chatModel, required this.sourceChat});
  final ChatModel chatModel;
  final ChatModel sourceChat;

  @override
  State<IndividualPage> createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {
  FocusNode focusNode = FocusNode();
  final _scrollController = ScrollController();
  late IO.Socket socket;
  TextEditingController _controller = TextEditingController();
  bool show = false;
  bool sendButton = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    connect();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          show = false;
        });
      }
    });
  }

  void connect() {
    socket = IO.io("http://192.168.214.76:5000", <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false,
    });
    socket.connect();
    socket.emit("signin", widget.sourceChat.id);
    socket.onConnect((data) {
      print("Connected");
      socket.on("message", (msg) {
        print(msg);
      });
    });
  }

  void sendMessage(String message, int sourceId, int targetId) {
    socket.emit("message",
        {"message": message, "sourceId": sourceId, "targetId": targetId});
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/whata_back.png",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            titleSpacing: 0,
            leadingWidth: 70,
            leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.arrow_back,
                    size: 24,
                  ),
                  CircleAvatar(
                    radius: 20,
                    child: SvgPicture.asset(
                      (widget.chatModel.isGroup ?? false)
                          ? "assets/groups.svg"
                          : "assets/person.svg",
                      height: 24,
                      width: 24,
                    ),
                    backgroundColor: Colors.blueGrey,
                  ),
                ],
              ),
            ),
            title: InkWell(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.all(6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.chatModel.name,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.5),
                    ),
                    const Text(
                      "last seen today at 12:05",
                      style: TextStyle(
                          fontSize: 13, overflow: TextOverflow.visible),
                    )
                  ],
                ),
              ),
            ),
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.videocam)),
              IconButton(onPressed: () {}, icon: Icon(Icons.call)),
              PopupMenuButton<String>(onSelected: (value) {
                print(value);
              }, itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    child: Text("View Contact"),
                    value: "View contact",
                  ),
                  PopupMenuItem(
                    child: Text("Media,links and docs"),
                    value: "Media,links and docs",
                  ),
                  PopupMenuItem(
                    child: Text("Whatsapp web"),
                    value: "Whatsapp web",
                  ),
                  PopupMenuItem(
                    child: Text("Search"),
                    value: "Search",
                  ),
                  PopupMenuItem(
                    child: Text("Mute notifiaction"),
                    value: "Mute notifiaction",
                  ),
                  PopupMenuItem(
                    child: Text("Wallpaper"),
                    value: "Wallpaper",
                  ),
                ];
              })
            ],
          ),
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: WillPopScope(
              onWillPop: () async {
                if (show) {
                  setState(() {
                    show = false;
                  });
                  return false; // Prevents popping the route
                } else {
                  return true; // Allows popping the route
                }
              },
              child: Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height - 150,
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        OwnMessageCard(),
                        ReplyCard(),
                        OwnMessageCard(),
                        ReplyCard(),
                        OwnMessageCard(),
                        ReplyCard(),
                        OwnMessageCard(),
                        ReplyCard(),
                        OwnMessageCard(),
                        ReplyCard(),
                        OwnMessageCard(),
                        ReplyCard(),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Container(
                                width: MediaQuery.of(context).size.width - 60,
                                child: Card(
                                    margin: EdgeInsets.only(
                                        left: 4, right: 3, bottom: 8),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    child: TextFormField(
                                      controller: _controller,
                                      focusNode: focusNode,
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      maxLines: 10,
                                      minLines: 1,
                                      onChanged: (value) {
                                        if (value.length > 0) {
                                          setState(() {
                                            sendButton = true;
                                          });
                                        } else {
                                          setState(() {
                                            sendButton = false;
                                          });
                                        }
                                      },
                                      keyboardType: TextInputType.multiline,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Type a message",
                                          prefixIcon: IconButton(
                                            icon: Icon(Icons.emoji_emotions),
                                            onPressed: () {
                                              focusNode.unfocus();
                                              setState(() {
                                                show = !show;
                                              });
                                            },
                                          ),
                                          suffixIcon: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              IconButton(
                                                  onPressed: () {
                                                    showModalBottomSheet(
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        context: context,
                                                        builder: (builder) =>
                                                            bottomSheet());
                                                  },
                                                  icon: Icon(
                                                    Icons.attach_file,
                                                  )),
                                              IconButton(
                                                  onPressed: () {},
                                                  icon: Icon(
                                                    Icons.camera_alt,
                                                  ))
                                            ],
                                          )),
                                    ))),
                            Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 8, right: 5, left: 2),
                              child: CircleAvatar(
                                backgroundColor: Color(0xFF128C7E),
                                radius: 25,
                                child: IconButton(
                                  icon: Icon(
                                    sendButton ? Icons.send : Icons.mic,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    if (sendButton) {
                                      sendMessage(
                                          _controller.text,
                                          widget.sourceChat.id!,
                                          widget.chatModel.id!);
                                      _controller.clear();
                                    }
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        show ? emojiSelect() : Container(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget emojiSelect() {
    return SizedBox(
      height: 280,
      child: EmojiPicker(
        textEditingController: _controller,
        scrollController: _scrollController,
        config: Config(
          height: 256,
          checkPlatformCompatibility: true,
          emojiViewConfig: EmojiViewConfig(
            // Issue: https://github.com/flutter/flutter/issues/28894
            emojiSizeMax: 28 *
                (foundation.defaultTargetPlatform == TargetPlatform.iOS
                    ? 1.2
                    : 1.0),
          ),
        ),
      ),
    );
  }

  //
  Widget bottomSheet() {
    return Container(
      height: 278,
      width: MediaQuery.of(context).size.width,
      child: Card(
        margin: EdgeInsets.all(18),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconCreation(
                      Icons.insert_drive_file, Colors.indigo, "Document"),
                  SizedBox(
                    width: 40,
                  ),
                  iconCreation(Icons.camera_alt, Colors.pink, "Camera"),
                  SizedBox(
                    width: 40,
                  ),
                  iconCreation(Icons.insert_photo, Colors.purple, "Gallery"),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconCreation(Icons.headset, Colors.orange, "Audio"),
                  SizedBox(
                    width: 40,
                  ),
                  iconCreation(Icons.location_pin, Colors.teal, "Location"),
                  SizedBox(
                    width: 40,
                  ),
                  iconCreation(Icons.person, Colors.blue, "Contact"),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget iconCreation(IconData icon, Color color, String text) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: color,
            child: Icon(
              icon,
              size: 29,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
