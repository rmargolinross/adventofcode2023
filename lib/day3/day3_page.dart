import 'package:adventofcode2022/common/engine_schematic.dart';
import 'package:adventofcode2022/common/widgets/puzzle_input_output.dart';
import 'package:flutter/material.dart';

class Day3Page extends StatelessWidget {
  const Day3Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Day 3')),
      body: PuzzleInputOutput(
        button1Label: 'Get Sum Of Parts',
        button1Calculation: (input) {
          var schematic = EngineSchematic.fromString(input);
          return schematic.sumOfPartNumbers().toString();
        },
        button2Label: 'Sum of Gear Ratios',
        button2Calculation: (input) {
          var schematic = EngineSchematic.fromString(input);
          return schematic.sumOfGearRatios().toString();
        },
      ),
    );
  }
}
