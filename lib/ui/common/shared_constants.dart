import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color primary = Color(0xFF9DB1FC);
}

class AppThemes {
  static ThemeData light = FlexColorScheme.light(
    colors: FlexSchemeColor.from(primary: AppColors.primary),
    lightIsWhite: true,
    appBarStyle: FlexAppBarStyle.scaffoldBackground,
    useMaterial3: true,
    fontFamily: GoogleFonts.interTight().fontFamily,
  ).toTheme;
  static ThemeData dark = FlexColorScheme.dark(
    colors: FlexSchemeColor.from(primary: AppColors.primary),
    darkIsTrueBlack: true,
    appBarStyle: FlexAppBarStyle.scaffoldBackground,
    useMaterial3: true,
    fontFamily: GoogleFonts.interTight().fontFamily,
  ).toTheme;
}
