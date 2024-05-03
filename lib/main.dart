import 'package:chat_app/screens/chat.dart';
import 'package:chat_app/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent, foregroundColor: Colors.white),
        scaffoldBackgroundColor: const Color(0xFF6a5bff),
        fontFamily: GoogleFonts.inter().fontFamily,
        useMaterial3: true,
      ),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/chat':
            return PageTransition(
              child: const Chat(),
              type: PageTransitionType.rightToLeftWithFade,
            );
          default:
            return null;
        }
      },
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Convo Cove",
            style: GoogleFonts.ubuntu(fontWeight: FontWeight.bold),
          ),
          actions: [
            SvgPicture.asset(
              'assets/icons/menu.svg', // Path to your SVG file
              width: 32,
              height: 32,
              color: Colors.white,
            ),
            const SizedBox(
              width: 12,
            )
          ],
        ),
        body: const Home(),
      ),
    );
  }
}
