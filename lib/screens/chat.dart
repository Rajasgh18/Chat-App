import 'package:chat_app/components/box_wrapper.dart';
import 'package:chat_app/components/message_item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    List chats = [
      {
        "text": "Hi, I'm doing good, thanks for asking. How about you?",
        "type": MesgType.reciever
      },
      {"text": "Same here", "type": MesgType.sender},
    ];

    final Map<String, dynamic> args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    int id = args['id'] ?? 0;
    String avatar = "";
    String name = "";

    switch (id) {
      case 1:
        name = "Goku";
        avatar = "assets/avatar1.jpg";
        break;
      case 2:
        name = "Satoru Gojo";
        avatar = "assets/avatar2.jpg";
        break;
      case 3:
        name = "Yamanaka";
        avatar = "assets/avatar3.jpg";
        break;
    }
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: SafeArea(
          child: AppBar(
            flexibleSpace: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: GoogleFonts.nunito(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.green.shade400),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      "Online",
                      style:
                          GoogleFonts.nunito(fontSize: 14, color: Colors.white),
                    )
                  ],
                )
              ],
            ),
            centerTitle: true,
            actions: [
              TextButton(
                onPressed: () {},
                child: const Icon(
                  Icons.more_horiz_rounded,
                  color: Colors.white,
                  size: 28,
                ),
              )
            ],
          ),
        ),
      ),
      body: BoxWrapper(
        child: ListView.builder(
          itemCount: chats.length,
          itemBuilder: (context, index) => MessageItem(
            mesg: chats[index]['text'],
            mesgType: chats[index]['type'],
            image: avatar,
          ),
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
        color: const Color(0xFFefefef),
        child: Row(
          children: [
            TextButton(
              style: ButtonStyle(
                  iconSize: MaterialStateProperty.all<double>(28),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                      const CircleBorder()),
                  iconColor: MaterialStateProperty.all<Color>(Colors.black54)),
              onPressed: () {},
              child: const Icon(Icons.add_rounded),
            ),
            Expanded(
              child: Container(
                width: 220,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(24),
                  ),
                  color: Colors.grey.shade100,
                ),
                child: TextFormField(
                  decoration: const InputDecoration(
                      hintText: "Type Message",
                      border: InputBorder.none,
                      // filled: true,
                      // fillColor: Colors.grey.shade100,

                      suffixIcon: Icon(Icons.emoji_emotions_outlined)),
                  // expands: true,
                  maxLines: 4,
                  minLines: 1,
                  style: GoogleFonts.nunito(),
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      const EdgeInsets.all(8)),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                      const CircleBorder())),
              child: const Icon(Icons.keyboard_voice),
            )
          ],
        ),
      ),
    );
  }
}
