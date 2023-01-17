// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:game/core/gameLogic.core.dart';

import 'models/boardCell.model.dart';

void main() {
  // runApp(GameWidget(game: SpaceShooterGame()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home: playField(40));
        home: GridView.count(
            padding: const EdgeInsets.fromLTRB(15, 70, 15, 0),
            crossAxisCount: boardWidth,
            children: BoardCell.multiplyCells(numberOfCell)));
  }
}

/*
GestureDetector cellMaker() {
  String cellText = 'E';
  return GestureDetector(
    onTap: () {
      if (cellText == 'E') {
        cellText = 'Player';
      }
      print(cellText);
    },
    child: Container(
        padding: const EdgeInsets.all(8),
        color: Colors.teal[100],
        child: Center(
            child: Text(
          cellText,
          style: const TextStyle(
            color: Colors.blue,
          ),
        ))),
  );
}

List<GestureDetector> playBoardMaker(int n) {
  List<GestureDetector> blocks = [];

  for (int i = 0; i < 5; i++) {
    blocks.add(GestureDetector(
      child: const SizedBox(),
    ));
  }
  for (int i = 0; i < n; i++) {
    blocks.add(cellMaker());
  }
  return blocks;
}

GridView playField(int n) {
  return GridView.count(
    primary: false,
    padding: const EdgeInsets.all(20),
    crossAxisSpacing: 5,
    mainAxisSpacing: 5,
    crossAxisCount: 5,
    children: playBoardMaker(n),
  );
}
void test() {
  var playField = [];
  print("------\n");
  for (var i = 0; i < 99; i++) {
    var block = BlockModel(index: i + 1);
    playField.add(block);

    if ((i + 1) % 2 == 0) {
      block.updateSurroundings(direction: BlockModel.left);
      block.updateSurroundings(direction: BlockModel.right);
    }
    if ((i + 1) % 3 == 0) {
      block.changeType(BlockType.player);
    }
    if (i + 1 == 6) {
      block.resetState();
    }
  }

  var playerList = [];
  var leftList = [];
  for (var element in playField) {
    if (element.type == BlockType.player) {
      playerList.add(element.index);
    }
    if (element.surroundings.left) {
      leftList.add(element.index);
    }
  }
  print("-------");
  print("Player List");
  for (var element in playerList) {
    print("|$element|");
  }
  print("-------");
  for (var element in leftList) {
    print("|$element|");
  }
}
*/