import 'package:adventofcode2022/common/tuple.dart';
import 'package:flutter/material.dart';

class Calibration {
  final List<int> calibrationValues;

  Calibration(this.calibrationValues);

  static List<int> recoverInputs(List<String> values) {
    List<int> results = [];

    for (String row in values) {
      var first = '';
      var last = '';
      for (var char in row.characters) {
        var number = int.tryParse(char);
        if (number != null) {
          if (first.isEmpty) {
            first = number.toString();
          }
          last = number.toString();
        }
      }

      results.add(int.parse(first + last));
    }

    return results;
  }

  static List<int> recoverInputsComplex(List<String> values) {
    List<int> results = [];
    // Use look ahead to match overlapping instances
    var regex =
        RegExp(r'(?=(one|two|three|four|five|six|seven|eight|nine|[0-9]))');
    const stringNumbers = [
      'zero',
      'one',
      'two',
      'three',
      'four',
      'five',
      'six',
      'seven',
      'eight',
      'nine',
      '0',
      '1',
      '2',
      '3',
      '4',
      '5',
      '6',
      '7',
      '8',
      '9'
    ];
    for (String row in values) {
      var matches = regex.allMatches(row);
      var first = (stringNumbers.indexOf(matches.first[1]!) % 10).toString();
      var last = (stringNumbers.indexOf(matches.last[1]!) % 10).toString();
      results.add(int.parse(first + last));
    }

    return results;
  }

  int calculateSum() {
    int total = 0;
    calibrationValues.forEach((value) {
      total += value;
    });
    return total;
  }
}
