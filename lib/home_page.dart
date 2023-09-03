import 'package:flutter/material.dart';
import 'package:minesweeper/difficulties.dart';
import 'package:minesweeper/difficulty_selector.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedDifficulty = 0;

  void updateDifficulty(int newDifficulty) {
    setState(() {
      selectedDifficulty = newDifficulty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          DifficultySelector(
              difficulties: difficulties.map((e) => e.name).toList(),
              updateDifficulty: updateDifficulty),
          TextButton(
              onPressed: () => print(difficulties[selectedDifficulty].name),
              child: const Text("Play"))
        ],
      ),
    );
  }
}
