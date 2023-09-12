import 'package:flutter/material.dart';
import 'package:minesweeper/home/difficulties.dart';

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
  final PageController _pageController = PageController(initialPage: 0);

  void _previousDifficulty() {
    if (_currentIndex > 0) {
      widget.updateDifficulty(_currentIndex - 1);
      _pageController.animateToPage(_currentIndex - 1,
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);

      setState(() {
        _currentIndex--;
      });
    }
  }

  void _nextDifficulty() {
    if (_currentIndex < widget.difficulties.length - 1) {
      widget.updateDifficulty(_currentIndex + 1);
      _pageController.animateToPage(_currentIndex + 1,
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);

      setState(() {
        _currentIndex++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: _currentIndex != 0 ? 1 : 0,
              child: IconButton(
                icon: const Icon(Icons.navigate_before),
                onPressed: _previousDifficulty,
              ),
            ),
            Expanded(
              child: SizedBox(
                height: 24,
                child: PageView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _pageController,
                  itemBuilder: (context, index) => Container(
                    color: Colors.green,
                    child: Center(child: Text(difficulties[index].name)),
                  ),
                ),
              ),
            ),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: _currentIndex != widget.difficulties.length - 1 ? 1 : 0,
              child: IconButton(
                icon: const Icon(Icons.navigate_next),
                onPressed: _nextDifficulty,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
