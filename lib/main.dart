import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int? userInput = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Material(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (value) {
                userInput = int.tryParse(value) ?? 0;
              },
            ),
            ElevatedButton(
              child: const Text('Start'),
              onPressed: () {
                setState(() {});
              },
            ),
            _CountDown(userInput ?? 0)
          ],
        ),
      ),
    );
  }
}

// receive number, count - 1 every second and if user puts something else it'll start again
class _CountDown extends StatefulWidget {
  int countDownNum;
  _CountDown(this.countDownNum, {Key? key}) : super(key: key);

  @override
  _CountDownState createState() => _CountDownState();
}

class _CountDownState extends State<_CountDown> {
  @override
  void didUpdateWidget(_CountDown oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.countDownNum != oldWidget.countDownNum) {
      substract1();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      '${widget.countDownNum}',
      style: const TextStyle(fontSize: 35),
    );
  }

  substract1() {
    if (widget.countDownNum > 0) {
      Timer.periodic(const Duration(seconds: 1), (timer) {
        widget.countDownNum--;
        setState(() {});
      });
    }
  }
}
