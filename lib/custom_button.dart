import 'package:flutter/material.dart';
import 'package:minesweeper/palette.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final PaletteColor currentPalette;
  final Function onPressed;

  const CustomButton(
      {super.key,
      required this.text,
      required this.currentPalette,
      required this.onPressed});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
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
      child: FractionallySizedBox(
        widthFactor: 0.75,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(100),
            border:
                Border.all(width: 1, color: widget.currentPalette.mainColor),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Center(
              child: Text(
                widget.text,
                style: TextStyle(
                    fontSize: 20,
                    color: isPressed
                        ? widget.currentPalette.backgroundColor
                        : widget.currentPalette.invertedColor),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
