import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

@immutable
class AppTheme {
  const AppTheme._();

  // Custom colors
  static const Color _primaryColor = Color(0xFF6B4EFF);
  static const Color _secondaryColor = Color(0xFFFF8C42);
  static const Color _errorColor = Color(0xFFFF4B4B);
  static const Color _lightBackground = Color(0xFFF8F9FF);
  static const Color _darkBackground = Color(0xFF1A1B1E);
  static const Color _cardLight = Colors.white;
  static const Color _cardDark = Color(0xFF2C2D30);

  static final lightTheme = ThemeData(
    primaryColor: _primaryColor,
    useMaterial3: true,
    colorScheme: const ColorScheme.light(
      primary: _primaryColor,
      secondary: _secondaryColor,
      error: _errorColor,
      surface: _lightBackground,
      onSurface: Colors.black87,
    ),
    appBarTheme: AppBarTheme(
      foregroundColor: _primaryColor,
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      titleTextStyle: GoogleFonts.poppins(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.black87,
      ),
    ),
    cardTheme: CardTheme(
      color: _cardLight,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      shadowColor: _primaryColor.withValues(alpha: 0.1),
    ),
    iconTheme: const IconThemeData(
      color: _primaryColor,
      size: 24,
    ),
    scaffoldBackgroundColor: _lightBackground,
    textTheme: GoogleFonts.poppinsTextTheme().copyWith(
      headlineLarge: GoogleFonts.poppins(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
      headlineMedium: GoogleFonts.poppins(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: Colors.black87,
      ),
      headlineSmall: GoogleFonts.poppins(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.black87,
      ),
      bodyLarge: GoogleFonts.poppins(
        fontSize: 16,
        color: Colors.black87,
      ),
      bodyMedium: GoogleFonts.poppins(
        fontSize: 14,
        color: Colors.black87,
      ),
      bodySmall: GoogleFonts.poppins(
        fontSize: 12,
        color: Colors.black87,
      ),
    ),
  );

  static final darkTheme = ThemeData(
    primaryColor: _primaryColor,
    useMaterial3: true,
    colorScheme: const ColorScheme.dark(
      primary: _primaryColor,
      secondary: _secondaryColor,
      error: _errorColor,
      surface: _cardDark,
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      titleTextStyle: GoogleFonts.poppins(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    ),
    cardTheme: CardTheme(
      color: _cardDark,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      shadowColor: Colors.black26,
    ),
    iconTheme: const IconThemeData(
      color: Colors.white,
      size: 24,
    ),
    scaffoldBackgroundColor: _darkBackground,
    textTheme:
        GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme).copyWith(
      headlineLarge: GoogleFonts.poppins(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      headlineMedium: GoogleFonts.poppins(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      headlineSmall: GoogleFonts.poppins(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      bodyLarge: GoogleFonts.poppins(
        fontSize: 16,
        color: Colors.white,
      ),
      bodyMedium: GoogleFonts.poppins(
        fontSize: 14,
        color: Colors.white,
      ),
      bodySmall: GoogleFonts.poppins(
        fontSize: 12,
        color: Colors.white,
      ),
    ),
  );
}
