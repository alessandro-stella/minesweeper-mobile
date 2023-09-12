import 'package:flutter/material.dart';
import 'package:minesweeper/palette.dart';

class PaletteSelector extends StatefulWidget {
  final Function updatePalette;
  const PaletteSelector({super.key, required this.updatePalette});

  @override
  State<PaletteSelector> createState() => _PaletteSelectorState();
}

class _PaletteSelectorState extends State<PaletteSelector> {
  List<Widget> createPaletteColors() {
    List<Widget> colors = [];

    for (var index = 0; index < palette.length; index++) {
      colors.add(
        TextButton(
          onPressed: () => widget.updatePalette(palette[index]),
          child: Text(
            index.toString(),
            style: TextStyle(
                backgroundColor: palette[index].backgroundColor,
                color: palette[index].mainColor),
          ),
        ),
      );
    }

    return colors;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: createPaletteColors(),
    );
  }
}
