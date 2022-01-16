import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

/* 
  scaffold
  70% of the width
  center vertically
*/

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: _TicTacToe(),
      ),
    );
  }
}

class _TicTacToe extends StatelessWidget {
  const _TicTacToe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              _CustomContainer(
                border: Border(
                  right: BorderSide(color: Colors.black),
                  bottom: BorderSide(color: Colors.black),
                ),
              ),
              _CustomContainer(
                border: Border(
                  right: BorderSide(color: Colors.black),
                  bottom: BorderSide(color: Colors.black),
                ),
              ),
              _CustomContainer(
                border: Border(
                  right: BorderSide(color: Colors.transparent),
                  bottom: BorderSide(color: Colors.black),
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              _CustomContainer(
                border: Border(
                  right: BorderSide(color: Colors.black),
                  bottom: BorderSide(color: Colors.black),
                ),
              ),
              _CustomContainer(
                border: Border(
                  right: BorderSide(color: Colors.black),
                  bottom: BorderSide(color: Colors.black),
                ),
              ),
              _CustomContainer(
                border: Border(
                  right: BorderSide(color: Colors.transparent),
                  bottom: BorderSide(color: Colors.black),
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              _CustomContainer(
                border: Border(
                  right: BorderSide(color: Colors.black),
                ),
              ),
              _CustomContainer(
                border: Border(
                  right: BorderSide(color: Colors.black),
                ),
              ),
              _CustomContainer(
                border: Border(
                  right: BorderSide(color: Colors.transparent),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _CustomContainer extends StatelessWidget {
  final Border border;
  const _CustomContainer({
    Key? key,
    required this.border,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(border: border),
      height: 80,
      width: (screenWidth * 0.70) / 3,
    );
  }
}
