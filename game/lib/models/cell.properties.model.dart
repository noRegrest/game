enum CellType { empty, player, red, green }

class Surroundings {
  final bool left;
  final bool right;
  final bool up;
  final bool down;

  const Surroundings(
      {required this.left,
      required this.right,
      required this.up,
      required this.down});

  Surroundings copyWith(
      {required bool left,
      required bool right,
      required bool up,
      required bool down}) {
    return Surroundings(left: left, right: right, up: up, down: down);
  }
}
