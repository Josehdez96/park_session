import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late int? userInput;
  late int? numToShow = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: Material(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextField(
              onChanged: (value) {
                userInput = int.tryParse(value) ?? 0;
              },
            ),
            IconButton(
              onPressed: () {
                numToShow = userInput;
                setState(() {});
              },
              icon: const Icon(Icons.ac_unit),
            ),
            _CountDown(numToShow ?? 0)
          ],
        ),
      ),
    );
  }
}

// receive number, count - 1 every second and if user puts something else it'll start again
class _CountDown extends StatefulWidget {
  final int countDownNum;
  const _CountDown(this.countDownNum, {Key? key}) : super(key: key);

  @override
  _CountDownState createState() => _CountDownState();
}

class _CountDownState extends State<_CountDown> {
  late int countDownNum;

  @override
  void initState() {
    super.initState();
    countDownNum = widget.countDownNum;
  }

  @override
  void didUpdateWidget(_CountDown oldWidget) {
    super.didUpdateWidget(oldWidget);
    countDownNum = widget.countDownNum;
    if (widget.countDownNum != oldWidget.countDownNum) {
      substract1();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text('$countDownNum');
  }

  substract1() {
    if (countDownNum > 0) {
      Timer.periodic(const Duration(seconds: 1), (timer) {
        countDownNum--;
        setState(() {});
      });
    }
  }
}
