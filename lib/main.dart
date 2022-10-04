import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:paperclipproject/Screen/HomePage/HomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PaperClip Project',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme:
              ColorScheme.fromSwatch().copyWith(primary: HexColor("#304373"))),
      home: const HomePage(),
    );
  }
}
