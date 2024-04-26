import 'package:chat_app/components/home_appbar.dart';
import 'package:chat_app/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        scaffoldBackgroundColor: const Color(0xFF6a5bff),
        fontFamily: GoogleFonts.inter().fontFamily,
        useMaterial3: true,
      ),
      home: const Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: HomeAppbar(),
        ),
        body: Home(),
      ),
    );
  }
}
