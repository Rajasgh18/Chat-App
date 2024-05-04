import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum MesgType { reciever, sender }

class MessageItem extends StatelessWidget {
  final String mesg;
  final MesgType mesgType;
  const MessageItem({super.key, required this.mesg, required this.mesgType});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: mesgType == MesgType.sender
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        children: [
          mesgType == MesgType.sender
              ? const SizedBox()
              : const CircleAvatar(
                  backgroundImage: AssetImage("assets/avatar1.jpg"),
                  radius: 20,
                ),
          const SizedBox(width: 8),
          Container(
            constraints: const BoxConstraints(maxWidth: 240),
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              color: mesgType == MesgType.sender
                  ? const Color(0xFF6a5bff)
                  : Colors.white,
            ),
            child: Text(
              mesg,
              style: GoogleFonts.inter(
                  color: mesgType == MesgType.sender
                      ? Colors.white
                      : Colors.black87),
            ),
          ),
        ],
      ),
    );
  }
}
