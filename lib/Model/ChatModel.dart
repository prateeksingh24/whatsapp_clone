class ChatModel {
  String name;
  String icon;
  bool? isGroup;
  String time;
  String currentMessage;
  String? status;
  bool select = false;
  int? id;

  ChatModel({
    required this.name,
    required this.icon,
    required this.currentMessage,
    this.isGroup,
    required this.time,
    this.status,
    this.select = false,
    this.id,
  });
}
