import 'package:adventofcode2022/common/scratchcard.dart';
import 'package:adventofcode2022/common/widgets/puzzle_input_output.dart';
import 'package:flutter/material.dart';

class Day4Page extends StatelessWidget {
  const Day4Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Day 4')),
      body: PuzzleInputOutput(
        button1Label: 'Get Total Points',
        button1Calculation: (input) {
          var total = 0;
          for (var card in input.split('\n')) {
            var scratcher = ScratchCard.fromCard(card);
            total += scratcher.getCardPoints();
          }

          return total.toString();
        },
        button2Label: 'Total Cards Won',
        button2Calculation: (input) {
          var scratchCards = ScratchCards.fromString(input);
          return scratchCards.playGame().toString();
        },
      ),
    );
  }
}
