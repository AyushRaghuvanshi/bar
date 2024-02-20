import 'package:flutter/material.dart';

class BarItem {
  final int start;
  final int end;
  final String value;
  final Color color;
  late int length;

  BarItem(
      {required this.start,
      required this.end,
      required this.color,
      required this.value}) {
    length = end - start;
  }
}
