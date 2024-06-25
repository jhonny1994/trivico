class GameConfig {
  GameConfig({
    required this.category,
    required this.difficulty,
    this.amount = 10,
    this.type = 'multiple',
  });
  final int amount;
  final int category;
  final String difficulty;
  final String type;
}
