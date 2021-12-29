import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const DicePage());
}

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 3;
  int rightDiceNumber = 4;
  int randomNumber() {
    return Random().nextInt(6) + 1;
  }

  void updateDice() {
    setState(() => {
          leftDiceNumber = randomNumber(),
          rightDiceNumber = randomNumber(),
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Dicee"),
          backgroundColor: Colors.red,
        ),
        backgroundColor: Colors.red,
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: leftDiceNumber > rightDiceNumber ? 2 : 1,
                child: TextButton(
                    child: Image.asset("images/dice$leftDiceNumber.png"),
                    onPressed: () => updateDice()),
              ),
              const SizedBox(width: 20.0),
              Expanded(
                flex: rightDiceNumber > leftDiceNumber ? 2 : 1,
                child: TextButton(
                    child: Image.asset("images/dice$rightDiceNumber.png"),
                    onPressed: () => updateDice()),
              )
            ],
          ),
        ),
      ),
    );
  }
}
