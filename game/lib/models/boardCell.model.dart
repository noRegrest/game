import 'package:flutter/material.dart';
import 'package:game/directions.dart';
import 'package:game/models/cell.properties.model.dart';

class BoardCell extends StatefulWidget {
  final int index;
  CellType _type;
  Surroundings _surroundings;
  static const String left = directions.left;
  static const String right = directions.right;
  static const String up = directions.up;
  static const String down = directions.down;

  BoardCell(
      {super.key,
      required this.index,
      CellType type = CellType.empty,
      Surroundings surroundings = const Surroundings(
          left: false, right: false, up: false, down: false)})
      : _type = type,
        _surroundings = surroundings;

  @override
  // ignore: library_private_types_in_public_api
  _BoardCellState createState() => _BoardCellState();

  set setType(CellType value) {
    _type = value;
  }

  CellType get type => _type;
  set setSurroundings(Surroundings value) {
    _surroundings = value;
  }

  Surroundings get surroundings => _surroundings;

  static BoardCell getCell(int index) {
    return BoardCell(index: index);
  }

  static List<BoardCell> multiplyCells(int n) {
    return List.generate(n, (i) => getCell(i));
  }
}

class _BoardCellState extends State<BoardCell> {
  late CellType _type;
  late Surroundings _surroundings;
  @override
  void initState() {
    _type = widget.type;
    _surroundings = widget.surroundings;
    super.initState();
  }

  void changeType(CellType newType) {
    setState(() {
      widget.setType = newType;
      _type = newType;
    });
  }

  void updateSurroundings({required String direction}) {
    setState(() {
      _surroundings = _surroundings.copyWith(
          left: direction == BoardCell.left
              ? !_surroundings.left
              : _surroundings.left,
          right: direction == BoardCell.right
              ? !_surroundings.right
              : _surroundings.right,
          up: direction == BoardCell.up ? !_surroundings.up : _surroundings.up,
          down: direction == BoardCell.down
              ? !_surroundings.down
              : _surroundings.down);
      widget.setSurroundings = _surroundings;
    });
  }

  void resetAll() {
    setState(() {
      _surroundings = _surroundings.copyWith(
          left: false, right: false, up: false, down: false);
      _type = CellType.empty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if ((widget.index + 1) % 2 == 0) {
          setState(() {
            updateSurroundings(direction: BoardCell.right);
          });
        }

        if (_type == CellType.empty) {
          // changeType(CellType.player);
          changeType(CellType.red);
        } else {
          changeType(CellType.empty);
        }
        // isBlocked(widget);
        print(widget.index);
        print("------");
      },
      onLongPress: () => resetAll(),
      onDoubleTap: () {
        changeType(CellType.player);
      },
      /*
        print("Index: ${widget.index + 1}");
        print("Type: ${_type.toString()}");
        print("Surroundings:");
        print(" - Left: ${_surroundings.left}");
        print(" - Right: ${_surroundings.right}");
        print(" - Up: ${_surroundings.up}");
        print(" - Down: ${_surroundings.down}");
        print("---------");
      */
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.black),
            color: _type == CellType.empty
                ? Colors.white
                : _type == CellType.player
                    ? Colors.blue
                    : _type == CellType.red
                        ? Colors.red
                        : Colors.green),
        child: const Center(
            // child: Text(
            //   "Index: ${widget.index + 1}\nType: ${_type.toString()}\nSurroundings: $_surroundings",
            //   style: const TextStyle(fontSize: 8.5),
            // ),
            ),
      ),
    );
  }
}
