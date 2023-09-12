import 'package:flutter/material.dart';

class PaletteColor {
  final Color mainColor;
  final Color backgroundColor;

  PaletteColor(this.mainColor, this.backgroundColor);
}

List<PaletteColor> palette = [
  PaletteColor(const Color(0xFF8cabeb), const Color(0xFF1b1b1d)),
  PaletteColor(const Color(0xFF988c62), const Color(0xFF191919)),
  PaletteColor(const Color(0xFF41a2cd), const Color(0xFF0d161d)),
  PaletteColor(const Color(0xFF359734), const Color(0xFF111111)),
  PaletteColor(const Color(0xFFb63462), const Color(0xFF1b1b1b)),
  PaletteColor(const Color(0xFFd77f37), const Color(0xFF333333)),
  PaletteColor(const Color(0xFFafc99c), const Color(0xFF373c36)),
  PaletteColor(const Color(0xFF7fabc6), const Color(0xFFf9f9f9)),
  PaletteColor(const Color(0xFFd7999e), const Color(0xFFf9f9f9)),
  PaletteColor(const Color(0xFF988c62), const Color(0xFFf9f9f9)),
];
