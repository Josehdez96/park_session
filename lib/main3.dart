import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/matrix_provider.dart';

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ChangeNotifierProvider(
          create: (_) => MatrixProvider(),
          child: _TicTacToe(),
        ),
      ),
    );
  }
}

class _TicTacToe extends StatelessWidget {
  final BorderSide borderSideColor = const BorderSide(color: Colors.black);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _CustomContainer(
                xAxis: 0,
                yAxis: 0,
                border: Border(
                  right: borderSideColor,
                  bottom: borderSideColor,
                ),
              ),
              _CustomContainer(
                xAxis: 0,
                yAxis: 1,
                border: Border(
                  right: borderSideColor,
                  bottom: borderSideColor,
                ),
              ),
              _CustomContainer(
                xAxis: 0,
                yAxis: 2,
                border: Border(
                  right: const BorderSide(color: Colors.transparent),
                  bottom: borderSideColor,
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _CustomContainer(
                xAxis: 1,
                yAxis: 0,
                border: Border(
                  right: borderSideColor,
                  bottom: borderSideColor,
                ),
              ),
              _CustomContainer(
                xAxis: 1,
                yAxis: 1,
                border: Border(
                  right: borderSideColor,
                  bottom: borderSideColor,
                ),
              ),
              _CustomContainer(
                xAxis: 1,
                yAxis: 2,
                border: Border(
                  right: const BorderSide(color: Colors.transparent),
                  bottom: borderSideColor,
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _CustomContainer(
                xAxis: 2,
                yAxis: 0,
                border: Border(
                  right: borderSideColor,
                ),
              ),
              _CustomContainer(
                xAxis: 2,
                yAxis: 1,
                border: Border(
                  right: borderSideColor,
                ),
              ),
              const _CustomContainer(
                xAxis: 2,
                yAxis: 2,
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
  final int xAxis;
  final int yAxis;

  const _CustomContainer({
    required this.border,
    required this.xAxis,
    required this.yAxis,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final matrixProvider = Provider.of<MatrixProvider>(context);

    return GestureDetector(
      onTap: () {
        if (matrixProvider.matrix[xAxis][yAxis] != '') {
          return;
        }

        if (matrixProvider.turn == true) {
          matrixProvider.setSymbolToMatrix(xAxis, yAxis, 'X');
        } else {
          matrixProvider.setSymbolToMatrix(xAxis, yAxis, 'O');
        }
        matrixProvider.changeTurn();

        final winner = _checkWinner(matrixProvider);
        if (winner != null) {
          final dialog = AlertDialog(
            title: Text('The $winner player had won'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Play again'),
              )
            ],
          );

          showDialog(context: context, builder: (_) => dialog);
        }
      },
      child: Container(
        decoration: BoxDecoration(border: border),
        height: 80,
        width: (screenWidth * 0.70) / 3,
        child: Center(
          child: Text(
            matrixProvider.matrix[xAxis][yAxis],
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
              color: (matrixProvider.matrix[xAxis][yAxis] == 'X')
                  ? Colors.black
                  : Colors.red,
            ),
          ),
        ),
      ),
    );
  }

  String? _checkWinner(MatrixProvider matrixProvider) {
    final List<List<String>> matrix = matrixProvider.matrix;
    int col = 0, row = 0, diag = 0, rdiag = 0;
    int n = matrixProvider.matrixLength - 1;
    String player = matrix[xAxis][yAxis];

    for (var i = 0; i < matrixProvider.matrixLength; i++) {
      if (matrix[xAxis][i] == player) {
        col++;
      }
      if (matrix[i][yAxis] == player) {
        row++;
      }
      if (matrix[i][i] == player) {
        diag++;
      }
      if (matrix[i][n - i] == player) {
        rdiag++;
      }

      if (row == n + 1 || col == n + 1 || diag == n + 1 || rdiag == n + 1) {
        matrixProvider.initMatrix();
        return player;
      } else {
        print(matrix);
        //
      }
    }
  }
}
