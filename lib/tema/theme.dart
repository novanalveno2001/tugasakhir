import 'package:flutter/material.dart';

ThemeData lightTheme(BuildContext context) {
  return ThemeData.light().copyWith(
    scaffoldBackgroundColor: Colors.white60,
  );
}

ThemeData darkTheme(BuildContext context) {
  return ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Colors.black54,
  );
}