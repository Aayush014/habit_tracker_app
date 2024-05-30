import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habit_tracker_app/Pages/home_page.dart';

class IntroPage extends StatefulWidget {
   const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    
    Timer(
      const Duration(
        seconds: 5
      ),
      () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const HomePage(),)),
    );
    
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 80,
            ),
            Row(
              children: [
                Text(
                  "GO FOR",
                  style: GoogleFonts.libreFranklin(
                      fontSize: 40, fontWeight: FontWeight.bold),
                ),
                Column(
                  children: [
                    Image.asset("Assets/Img/goFor.png"),
                    const SizedBox(
                      height: 35,
                    )
                  ],
                )
              ],
            ),
            Text(
              "BETTER\n\nHABITS\n",
              style: GoogleFonts.libreFranklin(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  height: 0.6,
                  color: const Color(0xFF007BFF)),
            ),
            Text(
              "WITH\n\nHABIT ALIGN",
              style: GoogleFonts.libreFranklin(
                  fontSize: 40, fontWeight: FontWeight.bold, height: 0.6),
            ),

            SizedBox(
                width: 100,
                child: Image.asset(
                  "Assets/Img/heartBeat.png",
                  fit: BoxFit.cover,
                )),
            const SizedBox(height: 80,),
            Align(
              alignment: Alignment.centerRight,
              child: Image.asset("Assets/Img/logo.png"),
            ),
          ],
        ),
      ),
    );
  }
}
