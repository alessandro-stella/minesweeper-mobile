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
      child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Padding(
              padding: const EdgeInsets.all(8.0), child: Text(widget.text))),
    );
  }
}
