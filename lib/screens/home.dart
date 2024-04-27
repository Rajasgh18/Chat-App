import "package:chat_app/components/contact_avatar.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:flutter_svg/flutter_svg.dart";

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "Contact List",
            style: TextStyle(color: Colors.white),
          ),
        ),
        const SizedBox(height: 8),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Row(
            children: [
              ContactAvatar(status: "active", url: "assets/avatar1.jpg"),
              SizedBox(width: 12),
              ContactAvatar(status: "sleepy", url: "assets/avatar2.jpg"),
              SizedBox(width: 12),
              ContactAvatar(status: "active", url: "assets/avatar3.jpg"),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32), topRight: Radius.circular(32)),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ColorFiltered(
                      colorFilter: const ColorFilter.mode(
                          Color(0xFF6a5bff), BlendMode.srcIn),
                      child: SvgPicture.asset(
                        'assets/icons/search.svg',
                        height: 24,
                        width: 24,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.yellow.shade300),
                          foregroundColor:
                              MaterialStateProperty.all(Colors.black),
                          elevation: MaterialStateProperty.all<double>(0),
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 4))),
                      child: Row(
                        children: [
                          const Text("Direct Messages"),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.all(6),
                            decoration: const BoxDecoration(
                                color: Colors.black, shape: BoxShape.circle),
                            child: const Text(
                              "4",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          )
                        ],
                      ),
                    ),
                    TextButton(onPressed: () {}, child: const Text("Group 4"))
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
