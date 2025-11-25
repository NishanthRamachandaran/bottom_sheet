import 'package:flutter/material.dart';

class DefaultColors {
  DefaultColors._();
  static const Color white = Color(0xFFFFFFFF);
  static const Color blue = Color(0xFF0078FF);
  static const Color gray100 = Color(0xFFF6F7FB);
  static const Color lightBlue = Color(0xFFEAF4FF);
  static Gradient primaryBackgroundGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: <Color>[
      const Color.fromARGB(255, 3, 38, 97),
      const Color.fromARGB(255, 1, 164, 129),
      const Color.fromARGB(255, 37, 147, 251),
    ],
  );
}
