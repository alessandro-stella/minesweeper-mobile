import 'package:flutter/material.dart';

class PaletteColor {
  final Color mainColor;
  final Color backgroundColor;
  final Color invertedColor;

  PaletteColor(this.mainColor, this.backgroundColor, this.invertedColor);
}

List<PaletteColor> palette = [
  PaletteColor(
    const Color(0xFF8cabeb),
    const Color(0xFF1b1b1d),
    const Color(0xFFe4e4e2),
  ),
  PaletteColor(
    const Color(0xFF988c62),
    const Color(0xFF191919),
    const Color(0xFFe6e6e6),
  ),
  PaletteColor(
    const Color(0xFF41a2cd),
    const Color(0xFF0d161d),
    const Color(0xFFf2e9e2),
  ),
  PaletteColor(
    const Color(0xFF359734),
    const Color(0xFF111111),
    const Color(0xFFeeeeee),
  ),
  PaletteColor(
    const Color(0xFFb63462),
    const Color(0xFF1b1b1b),
    const Color(0xFFe4e4e4),
  ),
  PaletteColor(
    const Color(0xFFd77f37),
    const Color(0xFF333333),
    const Color(0xFFcccccc),
  ),
  PaletteColor(
    const Color(0xFFafc99c),
    const Color(0xFF373c36),
    const Color(0xFFc8c3c9),
  ),
  PaletteColor(
    const Color(0xFF7fabc6),
    const Color(0xFFf9f9f9),
    const Color(0xFF060606),
  ),
  PaletteColor(
    const Color(0xFFd7999e),
    const Color(0xFFf9f9f9),
    const Color(0xFF060606),
  ),
  PaletteColor(
    const Color(0xFF988c62),
    const Color(0xFFf9f9f9),
    const Color(0xFF060606),
  ),
];
