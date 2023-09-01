import 'package:flutter/material.dart';

class DifficultySelector extends StatefulWidget {
  final List<String> difficulties;
  final Function updateDifficulty;

  const DifficultySelector(
      {super.key, required this.difficulties, required this.updateDifficulty});

  @override
  State<DifficultySelector> createState() => _DifficultySelectorState();
}

class _DifficultySelectorState extends State<DifficultySelector> {
  int _currentIndex = 0;

  void _previousString() {
    if (_currentIndex > 0) {
      widget.updateDifficulty(widget.difficulties[_currentIndex - 1]);

      setState(() {
        _currentIndex--;
      });
    }
  }

  void _nextString() {
    if (_currentIndex < widget.difficulties.length - 1) {
      widget.updateDifficulty(widget.difficulties[_currentIndex + 1]);

      setState(() {
        _currentIndex++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        if (_currentIndex != 0)
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: _previousString,
          ),
        Text(
          widget.difficulties[_currentIndex],
          style: const TextStyle(fontSize: 20),
        ),
        if (_currentIndex != widget.difficulties.length - 1)
          IconButton(
            icon: const Icon(Icons.arrow_forward),
            onPressed: _nextString,
          ),
      ],
    );
  }
}
