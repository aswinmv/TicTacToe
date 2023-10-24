import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool ohTurn = true;
  int filledbox = 0;

  List<String> displayXO = ["", "", "", "", "", "", "", "", ""];
  void tapped(int index) {
    setState(() {
      if (ohTurn && displayXO[index] == "") {
        displayXO[index] = "O";
        filledbox += 1;
      } else if (!ohTurn && displayXO[index] == "") {
        displayXO[index] = "X";
        filledbox += 1;
      }
      ohTurn = !ohTurn;
      checkWinner();
    });
  }

  void checkWinner() {
    if (displayXO[0] == displayXO[1] &&
        displayXO[0] == displayXO[2] &&
        displayXO[0] != "") {
      showDialbox(displayXO[0]);
    }
    if (displayXO[3] == displayXO[4] &&
        displayXO[3] == displayXO[5] &&
        displayXO[3] != "") {
      showDialbox(displayXO[5]);
    }
    if (displayXO[6] == displayXO[7] &&
        displayXO[6] == displayXO[8] &&
        displayXO[6] != "") {
      showDialbox(displayXO[6]);
    }
    if (displayXO[0] == displayXO[3] &&
        displayXO[0] == displayXO[6] &&
        displayXO[0] != "") {
      showDialbox(displayXO[3]);
    }
    if (displayXO[1] == displayXO[4] &&
        displayXO[1] == displayXO[7] &&
        displayXO[1] != "") {
      showDialbox(displayXO[7]);
    }
    if (displayXO[2] == displayXO[5] &&
        displayXO[2] == displayXO[8] &&
        displayXO[2] != "") {
      showDialbox(displayXO[8]);
    }
    if (displayXO[0] == displayXO[4] &&
        displayXO[0] == displayXO[8] &&
        displayXO[0] != "") {
      showDialbox(displayXO[4]);
    }
    if (displayXO[2] == displayXO[4] &&
        displayXO[2] == displayXO[6] &&
        displayXO[2] != "") {
      showDialbox(displayXO[2]);
    } else if (filledbox == 9) {
      showDrawdilog();
    }
  }

  void showDrawdilog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("It's A Draw"),
                FloatingActionButton(
                  onPressed: () {
                    clearBoard();
                    Navigator.of(context).pop();
                  },
                  child: const Text("Replay"),
                )
              ],
            ),
          );
        });
  }

  void showDialbox(String winner) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Winner is : $winner'),
                FloatingActionButton(
                  onPressed: () {
                    clearBoard();
                    Navigator.of(context).pop();
                  },
                  child: const Text("Replay"),
                )
              ],
            ),
          );
        });
    if (winner == "O") {
      ohScore += 1;
    } else if (winner == "X") {
      exScore += 1;
    }
  }

  void clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        displayXO[i] = "";
      }
    });
    filledbox = 0;
  }

  var myTextstyle = GoogleFonts.pressStart2p(color: Colors.white, fontSize: 15);
  int ohScore = 0;
  int exScore = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Player X",
                        style: myTextstyle,
                      ),
                      Text(
                        ohScore.toString(),
                        style: myTextstyle,
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Player O", style: myTextstyle),
                      Text(exScore.toString(), style: myTextstyle)
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: GridView.builder(
              itemCount: 9,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
              itemBuilder: (context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      tapped(index);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Color.fromARGB(255, 171, 156, 156))),
                      child: Center(
                        child: Text(
                          displayXO[index],
                          style: TextStyle(color: Colors.white, fontSize: 40),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: Container(
              child: Center(
                  child: Column(
                children: [
                  Text(
                    "Tic Tac Toe",
                    style: myTextstyle,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Created by Aswin",
                    style: GoogleFonts.pressStart2p(
                        color: Colors.white, fontSize: 10),
                  )
                ],
              )),
            ),
          )
        ],
      ),
    );
  }
}
