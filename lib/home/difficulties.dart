class Difficulty {
  final String name;
  final int bombs;
  final int verticalSize;
  final int horizontalSize;

  Difficulty(this.name, this.bombs, this.verticalSize, this.horizontalSize);
}

List<Difficulty> difficulties = [
  Difficulty("Beginner", 12, 22, 12),
  Difficulty("Easy", 10, 7, 10),
  Difficulty("Medium", 40, 12, 22),
  Difficulty("Hard", 100, 18, 32),
  Difficulty("Huge", 220, 27, 48),
  Difficulty("Extreme", 150, 18, 32),
  Difficulty("Ultra extreme", 380, 27, 48),
];
