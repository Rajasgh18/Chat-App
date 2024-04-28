import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContactAvatar extends StatelessWidget {
  final String url;
  final String status;
  final String type;
  const ContactAvatar(
      {super.key, this.url = "", required this.status, this.type = "contact"});
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(url),
          radius: 28,
        ),
        Positioned(
          right: -4,
          bottom: -4,
          child: Container(
              width: 20,
              height: 20,
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: status == "active"
                      ? Colors.green.shade400
                      : Colors.yellow.shade300,
                  border: Border.all(
                      width: 1.25,
                      color: type == "contact"
                          ? const Color(0xFF6a5bff)
                          : Colors.white)),
              child: status == "active"
                  ? const Icon(
                      size: 10,
                      color: Colors.white,
                      Icons.check,
                    )
                  : SvgPicture.asset(
                      "assets/icons/snooze.svg",
                    )),
        )
      ],
    );
  }
}
