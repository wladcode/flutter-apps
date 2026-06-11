import 'package:flutter/material.dart';
const colorList = <Color>[
  Colors.blue,
  Colors.red,
  Colors.green,
  Colors.yellow,
  Colors.purple,
  Colors.orange,
  Colors.brown,
  Colors.grey,
  Colors.black,
  Colors.white,
  Colors.blueGrey,
  Colors.deepPurple,
  Colors.deepOrange,
  Colors.deepPurpleAccent,
];
class AppTheme {
  final int selectedColor;
  AppTheme({required this.selectedColor})
  : assert(selectedColor >= 0 && selectedColor < colorList.length, 'selectedColor must be between 0 and ${colorList.length - 1}');
  
  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    colorSchemeSeed: colorList[selectedColor],
    appBarTheme: AppBarTheme(
      centerTitle: true,
    ),
  );
}