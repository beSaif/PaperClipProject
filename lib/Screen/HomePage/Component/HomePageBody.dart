import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:paperclipproject/API/OverviewAPI.dart';
import 'package:paperclipproject/Model/OverviewModel.dart';
import 'package:intl/intl.dart';
import 'package:paperclipproject/Screen/HomePage/Component/Overview.dart';
import 'package:paperclipproject/Screen/HomePage/Component/Performance.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({super.key});

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [Overview(), Performace()]);
  }
}
