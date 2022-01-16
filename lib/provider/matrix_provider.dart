import 'package:flutter/material.dart';

class MatrixProvider extends ChangeNotifier {
  final List<List<String>> _matrix = <List<String>>[];
  bool _turn = true;

  MatrixProvider() {
    initMatrix();
  }

  get matrix => _matrix;
  get matrixLength => _matrix.length;
  get turn => _turn;

  void setSymbolToMatrix(int xAxis, int yAxis, String symbol) {
    _matrix[xAxis][yAxis] = symbol;
    notifyListeners();
  }

  void changeTurn() {
    _turn = !turn;
  }

  void initMatrix() {
    _matrix.clear();
    _matrix
      ..add([])
      ..add([])
      ..add([]);

    for (var i = 0; i < _matrix.length; i++) {
      _matrix[i]
        ..add('')
        ..add('')
        ..add('');
    }
    notifyListeners();
  }
}
