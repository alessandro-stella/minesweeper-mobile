import 'package:flutter/material.dart';

class PaletteColor {
  final Color mainColor;
  final Color backgroundColor;

  PaletteColor(this.mainColor, this.backgroundColor);
}

List<PaletteColor> palette = [
  PaletteColor(Colors.black, Colors.white),
  PaletteColor(Colors.white, Colors.black),
  PaletteColor(Colors.cyanAccent, Colors.blue)
];
