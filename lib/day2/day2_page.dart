import 'package:adventofcode2022/common/cube_game.dart';
import 'package:adventofcode2022/common/widgets/puzzle_input_output.dart';
import 'package:flutter/material.dart';

class Day2Page extends StatelessWidget {
  const Day2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Day 2')),
      body: PuzzleInputOutput(
        button1Label: 'Total Viable Games',
        button1Calculation: (input) {
          var game = CubeGame(12, 14, 13);
          return game.getPossibleGames(input.split('\n')).toString();
        },
        button2Label: 'Total Power Sets',
        button2Calculation: (input) {
          var game = CubeGame(12, 14, 13);
          return game.getPowerOfGames(input.split('\n')).toString();
        },
      ),
    );
  }
}
