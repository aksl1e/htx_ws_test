import 'package:flutter/material.dart';

sealed class HomeTextStyles {
  static const TextStyle titleTextStyle = TextStyle(
    color: Colors.white,
    fontFamily: 'MadimiOne',
    fontSize: 27.0,
  );

  static const TextStyle itemTitleTextStyle = TextStyle(
      color: Colors.grey,
      letterSpacing: 2.0
  );

  static const TextStyle itemTextStyle = TextStyle(
      color: Color(0xFFFFD740),
      letterSpacing: 2.0,
      fontSize: 32.0,
      fontFamily: 'Impact'
  );

  static const TextStyle descriptionTextStyle = TextStyle(
      color: Colors.white,
      letterSpacing: 1.0,
      fontFamily: 'MadimiOne',
      fontSize: 20.0
  );
}