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
  final int userInput;

  const _CountDown(this.userInput, {Key? key}) : super(key: key);

  @override
  _CountDownState createState() => _CountDownState();
}

class _CountDownState extends State<_CountDown> {
  late int countDownNum = widget.userInput;
  Timer? timer;

  @override
  void didUpdateWidget(_CountDown oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.userInput != oldWidget.userInput) {
      countDownNum = widget.userInput;
      substract1();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      '$countDownNum',
      style: const TextStyle(fontSize: 35),
    );
  }

  substract1() {
    if (timer != null) cancelTimer();
    if (countDownNum > 0) {
      timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        countDownNum--;
        setState(() {});
      });
    }
  }

  cancelTimer() {
    timer!.cancel();
  }
}
