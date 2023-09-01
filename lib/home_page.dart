import 'package:flutter/material.dart';
import 'package:minesweeper/difficulties.dart';
import 'package:minesweeper/difficulty_selector.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedDifficulty = difficulties.keys.toList()[0];

  void updateDifficulty(String newDifficulty) {
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
              difficulties: difficulties.keys.toList(),
              updateDifficulty: updateDifficulty),
          TextButton(
              onPressed: () => print(difficulties[selectedDifficulty]),
              child: const Text("Play"))
        ],
      ),
    );
  }
}
