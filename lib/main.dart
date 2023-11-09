import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(const DiceApp());

class DiceApp extends StatelessWidget {
  const DiceApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.pink,
        hintColor: Colors.white,
        scaffoldBackgroundColor: Colors.pink,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Dice App'),
          backgroundColor: Colors.pinkAccent,
        ),
        body: const DicePage(),
      ),
    );
  }
}

class DicePage extends StatefulWidget {
  const DicePage({Key? key});

  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int left = 1;
  int right = 1;
  int total = 0;

  void DiceNum() {
    final left_num = 1 + Random().nextInt(6);
    final right_num = 1 + Random().nextInt(6);
    setState(() {
      left = left_num;
      right = right_num;
      total = left + right;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: DiceNum,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.pink,
                          width: 15.0,
                        ),
                      ),
                      width: 180,
                      height: 180,
                      child: Image.asset('images/dice$left.png'),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: DiceNum,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.pink,
                          width: 15.0,
                        ),
                      ),
                      width: 180,
                      height: 180,
                      child: Image.asset('images/dice$right.png'),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Text(
              'Total: $total',
              style: TextStyle(
                color: Theme.of(context).hintColor,
                fontSize: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}