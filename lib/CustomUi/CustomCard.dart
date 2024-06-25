import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:whatsapp_clone/Screens/individualPage.dart';

import '../Model/ChatModel.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.chatModel, required this.sourceChat});
  final ChatModel chatModel;
   final ChatModel sourceChat;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>IndividualPage(chatModel: chatModel, sourceChat: sourceChat,)));
      },
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          backgroundColor: Colors.blueGrey,
          child: SvgPicture.asset((chatModel.isGroup ?? false)?"assets/groups.svg":"assets/person.svg",height: 37,width: 37,),
        ),
        title:  Text(chatModel.name,style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),),
        subtitle: Row(
          children: [
            const Icon(Icons.done_all),
            const SizedBox(width: 3,),
            Text(chatModel.currentMessage,style: TextStyle(
              fontSize: 13,
            ),),
          ],
        ),

        trailing: Text(chatModel.time),

      ),
    );
  }
}
