import 'package:flutter/material.dart';

class EditorButton {
  Function press;
  IconData? icon;
  String? symbol;

  EditorButton({
    required this.press,
    this.icon,
    this.symbol,
  });
}
