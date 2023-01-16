enum BlockType { empty, player, red, green }

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
}

class BlockModel {
  BlockType type;
  final int index;
  Surroundings surroundings;

  BlockModel({required this.index, this.type = BlockType.empty})
      : surroundings = const Surroundings(
            left: false, right: false, up: false, down: false);

  void changeType(BlockType newType) {
    type = newType;
  }

  void updateSurroundings({required String direction}) {
    switch (direction) {
      case BlockModel.left:
        surroundings = Surroundings(
            left: !surroundings.left,
            right: surroundings.right,
            up: surroundings.up,
            down: surroundings.down);
        break;
      case BlockModel.right:
        surroundings = Surroundings(
            left: surroundings.left,
            right: !surroundings.right,
            up: surroundings.up,
            down: surroundings.down);
        break;
      case BlockModel.up:
        surroundings = Surroundings(
            left: surroundings.left,
            right: surroundings.right,
            up: !surroundings.up,
            down: surroundings.down);
        break;
      case BlockModel.down:
        surroundings = Surroundings(
            left: surroundings.left,
            right: surroundings.right,
            up: surroundings.up,
            down: !surroundings.down);
        break;
      default:
        break;
    }
  }

  void resetState() {
    surroundings =
        const Surroundings(left: false, right: false, up: false, down: false);
    type = BlockType.empty;
  }

  static const String left = 'left';
  static const String right = 'right';
  static const String up = 'up';
  static const String down = 'down';
}
