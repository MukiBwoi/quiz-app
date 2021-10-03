import 'package:flutter/material.dart';

SnackBar customSnackBar(String text, Color color) {
  final snackBar = SnackBar(
    duration: const Duration(milliseconds: 500),
    content: Text(text),
    backgroundColor: color,
  );
  return snackBar;
}
