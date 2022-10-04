import 'package:flutter/material.dart';
import 'package:paperclipproject/Screen/HomePage/Component/HomePageBody.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PaperClip Project'),
      ),
      body: const HomePageBody(),
    );
  }
}
