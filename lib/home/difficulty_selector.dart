import 'package:flutter/material.dart';
import 'package:invert_colors/invert_colors.dart';
import 'package:minesweeper/custom_icon.dart';
import 'package:minesweeper/home/difficulties.dart';
import 'package:minesweeper/palette.dart';

class DifficultySelector extends StatefulWidget {
  final List<String> difficulties;
  final Function updateDifficulty;
  final PaletteColor currentPalette;

  const DifficultySelector(
      {super.key,
      required this.difficulties,
      required this.updateDifficulty,
      required this.currentPalette});

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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AnimatedOpacity(
            duration: const Duration(milliseconds: 200),
            opacity: _currentIndex != 0 ? 1 : 0,
            child: CustomIcon(
              currentPalette: widget.currentPalette,
              onPressed: _previousDifficulty,
              icon: Icons.navigate_before,
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 24,
              child: PageView.builder(
                physics: const NeverScrollableScrollPhysics(),
                controller: _pageController,
                itemBuilder: (context, index) => Center(
                  child: Text(
                    difficulties[index].name,
                    style: TextStyle(
                      fontSize: 20,
                      color: widget.currentPalette.invertedColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
          AnimatedOpacity(
            duration: const Duration(milliseconds: 200),
            opacity: _currentIndex != widget.difficulties.length - 1 ? 1 : 0,
            child: CustomIcon(
              currentPalette: widget.currentPalette,
              onPressed: _nextDifficulty,
              icon: Icons.navigate_next,
            ),
          ),
        ],
      ),
    );
  }
}
