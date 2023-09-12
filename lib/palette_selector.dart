import 'package:flutter/material.dart';
import 'package:invert_colors/invert_colors.dart';
import 'package:minesweeper/palette.dart';

class PaletteSelector extends StatefulWidget {
  final Function updatePalette;
  final PaletteColor currentPalette;
  const PaletteSelector({
    super.key,
    required this.updatePalette,
    required this.currentPalette,
  });

  @override
  _PaletteSelectorState createState() => _PaletteSelectorState();
}

class _PaletteSelectorState extends State<PaletteSelector> {
  bool isExpanded = false;

  void toggleExpansion() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: isExpanded ? MediaQuery.of(context).size.width - 20 : 40,
            height: 40,
            padding: const EdgeInsets.only(right: 0),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: palette.length + 1,
                itemBuilder: (context, index) {
                  if (index != palette.length) {
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: GestureDetector(
                        onTap: () => widget.updatePalette(palette[index]),
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 8,
                                color: palette[index].backgroundColor),
                            color: palette[index].mainColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    );
                  }

                  return const SizedBox(width: 40);
                }),
          ),
        ),
        ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: IgnorePointer(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: isExpanded ? MediaQuery.of(context).size.width - 20 : 40,
                height: 40,
                padding: const EdgeInsets.only(right: 0),
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 1, color: widget.currentPalette.mainColor),
                    borderRadius: const BorderRadius.all(Radius.circular(20))),
              ),
            )),
        Positioned(
          top: 0,
          right: 0,
          child: Container(
            decoration: BoxDecoration(
              color: isExpanded
                  ? widget.currentPalette.mainColor
                  : widget.currentPalette.backgroundColor,
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: GestureDetector(
              onTap: toggleExpansion,
              child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Stack(
                    children: [
                      AnimatedOpacity(
                        duration: const Duration(milliseconds: 300),
                        opacity: isExpanded ? 1 : 0,
                        child: Icon(
                          Icons.palette,
                          size: 30,
                          color: widget.currentPalette.backgroundColor,
                        ),
                      ),
                      InvertColors(
                        child: AnimatedOpacity(
                          duration: const Duration(milliseconds: 300),
                          opacity: isExpanded ? 0 : 1,
                          child: Icon(
                            Icons.palette,
                            size: 30,
                            color: widget.currentPalette.backgroundColor,
                          ),
                        ),
                      )
                    ],
                  )),
            ),
          ),
        ),
      ],
    );
  }
}
