import 'package:adventofcode2022/common/calibaration.dart';
import 'package:adventofcode2022/common/widgets/puzzle_input_output.dart';
import 'package:flutter/material.dart';

class Day1Page extends StatelessWidget {
  const Day1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Day 1'),
      ),
      body: PuzzleInputOutput(
        button1Label: 'Sum Calibration Values',
        button1Calculation: (String input) {
          var calibration =
              Calibration(Calibration.recoverInputs(input.split('\n')));
          return calibration.calculateSum().toString();
        },
        button2Label: 'Sum Real Calibration Values',
        button2Calculation: (input) {
          var calibration =
              Calibration(Calibration.recoverInputsComplex(input.split('\n')));
          return calibration.calculateSum().toString();
        },
      ),
    );
  }
}
