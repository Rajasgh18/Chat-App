import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum MesgType { reciever, sender }

class MessageItem extends StatelessWidget {
  final String mesg;
  final MesgType mesgType;
  final String image;
  const MessageItem(
      {super.key,
      required this.mesg,
      required this.mesgType,
      required this.image});

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
              : CircleAvatar(
                  backgroundImage: AssetImage(image),
                  radius: 20,
                ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: mesgType == MesgType.sender
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.start,
            children: [
              Container(
                constraints: const BoxConstraints(maxWidth: 240),
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
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
              const SizedBox(height: 8),
              Text(
                "10:00 am",
                style: GoogleFonts.inter(fontSize: 10),
              )
            ],
          ),
        ],
      ),
    );
  }
}
