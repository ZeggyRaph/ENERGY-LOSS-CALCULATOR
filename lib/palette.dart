import 'package:flutter/material.dart';

// used to create color palette for the primarySwatch color in the light theme appbar.
class Palette {
  static const MaterialColor myColor = const MaterialColor(
    0xFF0A0E21,
    const <int, Color>{
      50: const Color(0xff090d1e),
      100: const Color(0xff080b1a),
      200: const Color(0xff070a17),
      300: const Color(0xff060814),
      400: const Color(0xff050711),
      500: const Color(0xff04060d),
      600: const Color(0xff03040a),
      700: const Color(0xff020307),
      800: const Color(0xff010103),
      900: const Color(0xff000000),
    },
  );
}

//textfield text styling
const textStyle = TextStyle(
  fontSize: 16.0,
  color: Color(0xFFA5672B),
);

//output text styling
const resultTextStyle = TextStyle(
  fontSize: 20.0,
  color: Color(0xFFA5672B),
);
