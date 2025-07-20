import 'package:flutter/material.dart';

class AppStyles {
  static const TextStyle titleStyle = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static const TextStyle subtitleStyle = TextStyle(
    fontSize: 16,
    color: Colors.white70,
  );

  static final BoxDecoration containerDecoration = BoxDecoration(
    color: Colors.grey[900],
    borderRadius: BorderRadius.circular(12),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.3),
        blurRadius: 6,
        offset: const Offset(0, 3),
      ),
    ],
  );

  static const EdgeInsets screenPadding = EdgeInsets.all(16.0);
}
