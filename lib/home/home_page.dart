import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:minesweeper/home/difficulties.dart';
import 'package:minesweeper/home/difficulty_selector.dart';
import 'package:minesweeper/palette_selector.dart';
import '../palette.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedDifficulty = 0;
  PaletteColor currentPalette = palette[0];

  void updateDifficulty(int newDifficulty) {
    setState(() {
      selectedDifficulty = newDifficulty;
    });
  }

  void updatePalette(PaletteColor newPalette) {
    setState(() {
      currentPalette = newPalette;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          PaletteSelector(updatePalette: updatePalette),
          FractionallySizedBox(
            widthFactor: 0.5,
            child: Container(
              color: currentPalette.backgroundColor,
              child: SvgPicture.asset("assets/mine.svg",
                  semanticsLabel: 'Mine', color: currentPalette.mainColor),
            ),
          ),
          DifficultySelector(
              difficulties: difficulties.map((e) => e.name).toList(),
              updateDifficulty: updateDifficulty),
          TextButton(
              onPressed: () => print(difficulties[selectedDifficulty].name),
              child: const Text("Play")),
        ],
      ),
    );
  }
}
