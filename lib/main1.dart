import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Timer? timer;
  late int savedNumber = 0;
  final StreamController<int> _showedNumStreamController = StreamController();
  Stream<int> get showedNum => _showedNumStreamController.stream;

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Material(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (value) => savedNumber = int.tryParse(value) ?? 0,
            ),
            ElevatedButton(
              child: const Text('Start'),
              onPressed: () => initCountDown(savedNumber),
            ),
            StreamBuilder<int>(
              stream: showedNum,
              builder: (_, snapshot) {
                return Text(
                  '${snapshot.data ?? 0}',
                  style: const TextStyle(fontSize: 35),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  initCountDown(int savedNumber) {
    if (timer != null) cancelTimer();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _showedNumStreamController.add(savedNumber);
      savedNumber--;
    });
  }

  cancelTimer() {
    timer!.cancel();
  }
}
