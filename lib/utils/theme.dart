import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData rekmedTheme = ThemeData(
  textTheme: GoogleFonts.dmSansTextTheme(),
  primaryColor: const Color(0xFFDF2155),
);

class AppTheme {
  static ThemeData get theme => rekmedTheme;
}
