import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  // Primary colors - warm beige and rose tones
  static const Color beige50 = Color(0xFFFCF8F3);
  static const Color beige100 = Color(0xFFF4EDE3);
  static const Color beige200 = Color(0xFFE8D5C4);
  static const Color beige300 = Color(0xFFD4B494);
  static const Color beige400 = Color(0xFFBFA072);
  static const Color beige500 = Color(0xFFAA8B5C);
  static const Color beige600 = Color(0xFF8F7548);
  static const Color beige700 = Color(0xFF6F5B38);
  static const Color beige800 = Color(0xFF5A4A2E);
  static const Color beige900 = Color(0xFF4A3D26);

  // Rose colors
  static const Color rose50 = Color(0xFFFEF2F2);
  static const Color rose100 = Color(0xFFFEE2E2);
  static const Color rose200 = Color(0xFFFECACA);
  static const Color rose300 = Color(0xFFFCA5A5);
  static const Color rose400 = Color(0xFFF87171);
  static const Color rose500 = Color(0xFFEF4444);
  static const Color rose600 = Color(0xFFDC2626);
  static const Color rose700 = Color(0xFFB91C1C);
  static const Color rose800 = Color(0xFF991B1B);
  static const Color rose900 = Color(0xFF7F1D1D);

  // Cream colors
  static const Color cream50 = Color(0xFFFFFBF7);
  static const Color cream100 = Color(0xFFFFF5EB);
  static const Color cream200 = Color(0xFFFEE7D6);

  // Soft accent colors
  static const Color softMint = Color(0xFF98D8C8);
  static const Color softLavender = Color(0xFFB8A8D1);
  static const Color softPeach = Color(0xFFF4B8A1);
  static const Color softSky = Color(0xFF87CEEB);
}

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      primaryColor: AppColors.rose500,
      scaffoldBackgroundColor: AppColors.beige50,

      // Color scheme
      colorScheme: const ColorScheme.light(
        primary: AppColors.rose500,
        secondary: AppColors.beige400,
        surface: Colors.white,
        background: AppColors.beige50,
        error: AppColors.rose600,
        onPrimary: Colors.white,
        onSecondary: AppColors.beige800,
        onSurface: AppColors.beige800,
        onBackground: AppColors.beige800,
        onError: Colors.white,
      ),

      // Typography
      textTheme: GoogleFonts.interTextTheme().copyWith(
        displayLarge: GoogleFonts.poppins(
          fontSize: 72,
          fontWeight: FontWeight.bold,
          color: AppColors.beige800,
          height: 1.1,
        ),
        displayMedium: GoogleFonts.poppins(
          fontSize: 56,
          fontWeight: FontWeight.bold,
          color: AppColors.beige800,
        ),
        displaySmall: GoogleFonts.poppins(
          fontSize: 45,
          fontWeight: FontWeight.bold,
          color: AppColors.beige800,
        ),
        headlineLarge: GoogleFonts.poppins(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: AppColors.beige800,
        ),
        headlineMedium: GoogleFonts.poppins(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: AppColors.beige800,
        ),
        headlineSmall: GoogleFonts.poppins(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: AppColors.beige800,
        ),
        titleLarge: GoogleFonts.inter(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: AppColors.beige800,
        ),
        titleMedium: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: AppColors.beige800,
        ),
        titleSmall: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppColors.beige700,
        ),
        bodyLarge: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: AppColors.beige700,
        ),
        bodyMedium: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.beige700,
        ),
        bodySmall: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: AppColors.beige600,
        ),
      ),

      // App bar theme
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white.withOpacity(0.9),
        elevation: 0,
        shadowColor: AppColors.beige200.withOpacity(0.3),
        titleTextStyle: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: AppColors.beige800,
        ),
        iconTheme: const IconThemeData(color: AppColors.beige600),
      ),

      // Card theme
      cardTheme: CardThemeData(
        color: Colors.white,
        shadowColor: const Color(0x1A8B7355),
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        margin: const EdgeInsets.all(8),
      ),

      // Button themes
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.rose500,
          foregroundColor: Colors.white,
          elevation: 4,
          shadowColor: AppColors.rose200,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          textStyle: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      // Input decoration theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white.withOpacity(0.8),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.beige200),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.beige200),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.rose400, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        hintStyle: GoogleFonts.inter(
          color: AppColors.beige500,
          fontSize: 16,
        ),
      ),

      // Floating action button theme
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.rose500,
        foregroundColor: Colors.white,
      ),

      // Bottom navigation bar theme
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white.withOpacity(0.9),
        selectedItemColor: AppColors.rose500,
        unselectedItemColor: AppColors.beige400,
        selectedLabelStyle: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w600),
        unselectedLabelStyle: GoogleFonts.inter(fontSize: 12),
      ),
    );
  }
}

// Custom box shadows for the warm, gentle aesthetic
class AppShadows {
  static const BoxShadow gentle = BoxShadow(
    color: Color(0x1A8B7355),
    blurRadius: 12,
    offset: Offset(0, 4),
  );

  static const BoxShadow soft = BoxShadow(
    color: Color(0x2A8B7355),
    blurRadius: 20,
    offset: Offset(0, 8),
  );

  static const BoxShadow rose = BoxShadow(
    color: Color(0x33EF4444),
    blurRadius: 16,
    offset: Offset(0, 6),
  );
}

// Custom gradients
class AppGradients {
  static const LinearGradient primaryButton = LinearGradient(
    colors: [AppColors.rose500, AppColors.rose600],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const LinearGradient background = LinearGradient(
    colors: [AppColors.beige50, AppColors.cream50, AppColors.rose50],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient cardHover = LinearGradient(
    colors: [Colors.white, AppColors.rose50],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient softMint = LinearGradient(
    colors: [AppColors.softMint, AppColors.beige400],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient softLavender = LinearGradient(
    colors: [AppColors.softLavender, AppColors.beige500],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient softPeach = LinearGradient(
    colors: [AppColors.softPeach, AppColors.rose400],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}