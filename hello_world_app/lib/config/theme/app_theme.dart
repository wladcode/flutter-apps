import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xFF1A237E);
  static const Color surface = Color(0xFFF4F6FB);
  static const Color cardColor = Colors.white;
  static const Color textPrimary = Color(0xFF1C1C2E);
  static const Color textSecondary = Color(0xFF8A8A9A);

  static ThemeData get theme => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: primary,
          brightness: Brightness.light,
          surface: surface,
        ),
        scaffoldBackgroundColor: surface,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 0,
          scrolledUnderElevation: 0,
          backgroundColor: primary,
          foregroundColor: Colors.white,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.4,
          ),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          elevation: 3,
          focusElevation: 6,
          shape: CircleBorder(),
        ),
        cardTheme: CardThemeData(
          color: cardColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(24)),
          ),
        ),
      );
}
