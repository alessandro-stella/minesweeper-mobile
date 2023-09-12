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
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        color: currentPalette.backgroundColor,
        child: Stack(children: [
          Positioned(
            top: 10,
            right: 10,
            child: PaletteSelector(
              currentPalette: currentPalette,
              updatePalette: updatePalette,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FractionallySizedBox(
                widthFactor: 0.5,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  color: currentPalette.backgroundColor,
                  child: SvgPicture.asset("assets/mine.svg",
                      semanticsLabel: 'Mine', color: currentPalette.mainColor),
                ),
              ),
              DifficultySelector(
                  currentPalette: currentPalette,
                  difficulties: difficulties.map((e) => e.name).toList(),
                  updateDifficulty: updateDifficulty),
              TextButton(
                  onPressed: () => print(difficulties[selectedDifficulty].name),
                  child: const Text("Play")),
            ],
          ),
        ]),
      ),
    );
  }
}
