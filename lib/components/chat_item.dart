import 'package:chat_app/components/contact_avatar.dart';
import 'package:flutter/material.dart';

class ChatItem extends StatelessWidget {
  final String name;
  final String message;
  final String image;
  final String status;
  const ChatItem({
    super.key,
    required this.name,
    required this.message,
    required this.image,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      leading: ContactAvatar(status: status, url: image, type: "Chat"),
      contentPadding: const EdgeInsets.all(0),
      title: Text(
        name,
        style: const TextStyle(fontSize: 16),
      ),
      subtitle: Text(
        "${message.substring(0, 53)}...",
        style: const TextStyle(fontSize: 12, color: Colors.black54),
        maxLines: 2,
      ),
      trailing: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("10:00am"),
          Icon(
            Icons.done_all_rounded,
            size: 20,
            color: Colors.black45,
          ),
        ],
      ),
      dense: true,
      enabled: true,
      enableFeedback: true,
    );
  }
}
