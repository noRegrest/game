// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import 'models/block.model.dart';

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
      // home: const LoginPage(),
      // home: const UserSetting(),
      home: const TextButton(onPressed: test, child: Text("test")),
      // home: const Test(),
    );
  }
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
