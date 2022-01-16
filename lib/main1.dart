import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // ignore: avoid_init_to_null
  Timer? timer = null;
  late int? savedNumber = 0;

  final StreamController<int> _showedNumStreamController = StreamController();
  Stream<int> get showedNum => _showedNumStreamController.stream;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Material(
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: TextField(
                  onChanged: (value) {
                    savedNumber = int.tryParse(value) ?? 0;
                  },
                ),
              ),
              TextButton(
                onPressed: () {
                  countDown(savedNumber!);
                },
                child: const Text('Click me'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                ),
              ),
              Expanded(
                child: StreamBuilder<int>(
                    stream: showedNum,
                    builder: (_, snapshot) {
                      return Text(
                        '${snapshot.data}',
                        style: const TextStyle(fontSize: 30),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  countDown(int savedNumber) {
    if (timer != null) {
      cancelTimer();
    }

    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _showedNumStreamController.add(savedNumber);
      savedNumber--;
    });
  }

  cancelTimer() {
    timer!.cancel();
  }
}
