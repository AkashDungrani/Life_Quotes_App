import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  List SplashQuotes = [
    "To be beautiful means to be yourself. You don�t need to be accepted by others. You need to accept yourself.\n\nThich Nhat Han",
    "Let me tell you the secret that has led me to my goal: my strength lies solely in my tenacity.\n\nLouis Pasteur",
    "We are what we think. All that we are arises with our thoughts. With our thoughts, we make the world.\n\nBuddha",
    "I cannot always control what goes on outside. But I can always control what goes on inside.\n\nWayne Dyer",
   "When you are offended at any man's fault, turn to yourself and study your own failings. Then you will forget your anger.\n\nEpictetus",
    "Do not go where the path may lead, go instead where there is no path and leave a trail.\n\nRalph Emerson",
    "When one tugs at a single thing in nature, he finds it attached to the rest of the world.\n\nJohn Muir",
  ];

  List SplashColors = [
    Colors.purple.withOpacity(0.3),
    Colors.teal.withOpacity(0.7),
    Colors.blue.withOpacity(0.7),
    Colors.orange.withOpacity(0.7),
    Colors.lightBlue.withOpacity(0.9),
    Colors.deepOrange.withOpacity(0.4),
    Colors.red.withOpacity(0.6),
  ];

  @override
  void initState() {
    Duration duration = Duration(seconds: 2);
    Timer(duration, () {
      Navigator.pushReplacementNamed(context, '/');
    });
    SplashQuotes.shuffle();
    SplashColors.shuffle();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(15),
        color: SplashColors.first,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Text(
              textAlign: TextAlign.center,
              "${SplashQuotes.first}",
              style: GoogleFonts.poppins(
                textStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              ),
            ),
            Spacer(),
            Text(
              "Quotes",
              style: GoogleFonts.poppins(
                textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
