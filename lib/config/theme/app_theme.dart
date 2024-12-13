import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData init({
    required bool isDarkMode,
  }) {
    return ThemeData(
      scaffoldBackgroundColor: isDarkMode ? Colors.grey.shade700 : Colors.white,
      textTheme: TextTheme(
        headlineLarge: GoogleFonts.openSansTextTheme().headlineLarge?.copyWith(
              color: isDarkMode ? Colors.white : Colors.grey,
            ),
        headlineMedium:
            GoogleFonts.openSansTextTheme().headlineMedium?.copyWith(
                  color: isDarkMode ? Colors.white : Colors.grey,
                ),
        headlineSmall: GoogleFonts.openSansTextTheme().headlineSmall?.copyWith(
              color: isDarkMode ? Colors.white : Colors.grey,
            ),
        displayLarge: GoogleFonts.openSansTextTheme().displayLarge?.copyWith(
              color: isDarkMode ? Colors.white : Colors.grey,
            ),
        displayMedium: GoogleFonts.openSansTextTheme().displayMedium?.copyWith(
              color: isDarkMode ? Colors.white : Colors.grey,
            ),
        displaySmall: GoogleFonts.openSansTextTheme().displaySmall?.copyWith(
              color: isDarkMode ? Colors.white : Colors.grey,
            ),
        titleLarge: GoogleFonts.openSansTextTheme().displaySmall?.copyWith(
              color: isDarkMode ? Colors.white : Colors.grey,
            ),
        titleMedium: GoogleFonts.openSansTextTheme().titleMedium?.copyWith(
              color: isDarkMode ? Colors.white : Colors.grey,
            ),
        titleSmall: GoogleFonts.openSansTextTheme().titleSmall?.copyWith(
              color: isDarkMode ? Colors.white : Colors.grey,
            ),
        bodyLarge: GoogleFonts.openSansTextTheme().bodyLarge?.copyWith(
              color: isDarkMode ? Colors.white : Colors.grey,
            ),
        bodyMedium: GoogleFonts.openSansTextTheme().bodyMedium?.copyWith(
              color: isDarkMode ? Colors.white : Colors.grey,
            ),
        bodySmall: GoogleFonts.openSansTextTheme().bodySmall?.copyWith(
              color: isDarkMode ? Colors.white : Colors.grey,
            ),
        labelLarge: GoogleFonts.openSansTextTheme().labelLarge?.copyWith(
              color: isDarkMode ? Colors.white : Colors.grey,
            ),
        labelMedium: GoogleFonts.openSansTextTheme().labelMedium?.copyWith(
              color: isDarkMode ? Colors.white : Colors.grey,
            ),
        labelSmall: GoogleFonts.openSansTextTheme().labelSmall?.copyWith(
              color: isDarkMode ? Colors.white : Colors.grey,
            ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(
            isDarkMode ? Colors.white : Colors.grey,
          ),
          textStyle: WidgetStatePropertyAll(
            GoogleFonts.openSansTextTheme().labelSmall?.copyWith(
                  color: isDarkMode ? Colors.white : Colors.grey,
                ),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: Colors.blue[100],
        filled: true,
        contentPadding: const EdgeInsets.all(0),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(
            30,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(
            30,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(
            30,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(
            30,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(
            30,
          ),
        ),
      ),
    );
  }
}
