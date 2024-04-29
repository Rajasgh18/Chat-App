import 'package:flutter/material.dart';

class BoxWrapper extends StatelessWidget {
  final Widget child;

  const BoxWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32), topRight: Radius.circular(32)),
          color: Colors.white,
        ),
        child: child,
      ),
    );
  }
}
