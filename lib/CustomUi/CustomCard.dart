import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:whatsapp_clone/Screens/individualPage.dart';

import '../Model/ChatModel.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.chatModel});
  final ChatModel chatModel;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>IndividualPage(chatModel: chatModel,)));
      },
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: SvgPicture.asset(chatModel.isGroup?"assets/groups.svg":"assets/person.svg",height: 37,width: 37,),
          backgroundColor: Colors.blueGrey,
        ),
        title:  Text(chatModel.name,style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),),
        subtitle: Row(
          children: [
            Icon(Icons.done_all),
            SizedBox(width: 3,),
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
