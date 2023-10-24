import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:tictaktoe/homepage.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Align(
              alignment: Alignment.topCenter,
              child: Text("TIC TAC TOE",
                  style: GoogleFonts.pressStart2p(
                      fontSize: 25, color: Colors.white))),
          SizedBox(
            height: 300,
            child: Lottie.asset("lib/assets/taac.json"),
          ),
          Text(
            "Created by Aswin",
            style: GoogleFonts.pressStart2p(fontSize: 15, color: Colors.white),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => const Homepage(),
              ));
            },
            child: Container(
              height: 60,
              width: 300,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Center(
                  child: Text(
                "PLAY GAME",
                style: GoogleFonts.pressStart2p(fontSize: 20),
              )),
            ),
          )
        ],
      ),
    );
  }
}
