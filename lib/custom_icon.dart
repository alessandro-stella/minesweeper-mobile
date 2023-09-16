import 'package:flutter/material.dart';
import 'package:minesweeper/palette.dart';

class CustomIcon extends StatefulWidget {
  final IconData icon;
  final PaletteColor currentPalette;
  final Function onPressed;

  const CustomIcon(
      {super.key,
      required this.icon,
      required this.currentPalette,
      required this.onPressed});

  @override
  State<CustomIcon> createState() => _CustomIconState();
}

class _CustomIconState extends State<CustomIcon> {
  bool isPressed = false;

  void _handleTapDown() {
    widget.onPressed();

    setState(() {
      isPressed = true;
    });
  }

  void _handleTapUp() {
    setState(() {
      isPressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Color buttonColor =
        isPressed ? widget.currentPalette.mainColor : Colors.transparent;

    return GestureDetector(
      onTapDown: (_) => _handleTapDown(),
      onTapUp: (_) => _handleTapUp(),
      onTapCancel: () => _handleTapUp(),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: buttonColor,
          shape: BoxShape.circle,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            widget.icon,
            color: isPressed
                ? widget.currentPalette.backgroundColor
                : widget.currentPalette.invertedColor,
          ),
        ),
      ),
    );
  }
}
