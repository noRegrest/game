import '../models/boardCell.model.dart';

void isBlocked(BoardCell boardCell) {
  print(boardCell.index);
  if (boardCell.surroundings.right) print("Blocked");
  print(boardCell.type);
}

List<BoardCell> boardCells = [];
// int checkedCellList = [] as int;
List<int> checkedCellList = [];
int boardWidth = 6;
List<int> goalsOfPlayer = List.generate(boardWidth, (i) => i);
List<int> goalsOfOpponent =
    List.generate(boardWidth, (i) => i + numberOfCell - boardWidth);

int boardHeight = 9;

int numberOfCell = boardHeight * boardWidth;

bool isWinnable(int i) {
  if (boardCells[i].index <= boardWidth) {
    return true;
  }
  if (!checkedCellList.contains(i)) {
    checkedCellList.add(i);
    if (i - boardWidth < 0) {
      if (!boardCells[i].surroundings.up) {
        isWinnable(i - boardWidth);
      }
    }
    if ((i + 1) % boardWidth == 0) {
      if (!boardCells[i].surroundings.right) {
        isWinnable(i + 1);
      }
    }
    if (i % boardWidth == 0) {
      if (!boardCells[i].surroundings.left) {
        isWinnable(i - 1);
      }
    }
    if (i + boardWidth >= numberOfCell) {
      if (!boardCells[i].surroundings.down) {
        isWinnable(i + boardWidth);
      }
    }
  }
  return false;
}

bool isWinnableFromEnds(int indexOfPlayer) {
  for (var goal in goalsOfPlayer) {
    checkedCellList.add(goal);
    if (!checkedCellList.contains(goal)) {
      if (goal == indexOfPlayer) return true;
    }
  }
  return false;
}
