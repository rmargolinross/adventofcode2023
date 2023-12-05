import 'dart:math';

import 'package:adventofcode2022/common/tuple.dart';
import 'package:flutter/material.dart';

class EngineSchematic {
  final List<List<String>> schematic;

  EngineSchematic(this.schematic);

  EngineSchematic.fromString(String schematicString)
      : schematic = schematicString
            .split('\n')
            .map((row) => row.trim().characters.toList())
            .toList();

  int sumOfPartNumbers() {
    var total = 0;

    for (int i = 0; i < schematic.length; i++) {
      var currentNumber = '';
      var validPartNumber = false;
      var row = schematic[i];

      for (int j = 0; j < row.length; j++) {
        var currentValue = int.tryParse(row[j]);
        if (currentValue != null) {
          currentNumber += currentValue.toString();
          if (_isValidPartNumber(i, j)) {
            validPartNumber = true;
          }
        } else {
          if (validPartNumber && currentNumber.isNotEmpty) {
            total += int.parse(currentNumber);
          }

          validPartNumber = false;
          currentNumber = '';
        }
      }

      if (validPartNumber && currentNumber.isNotEmpty) {
        total += int.parse(currentNumber);
      }
    }

    return total;
  }

  int sumOfGearRatios() {
    var total = 0;

    for (int i = 0; i < schematic.length; i++) {
      for (int j = 0; j < schematic[i].length; j++) {
        if (schematic[i][j] == '*') {
          total += _getGearValue(i, j);
        }
      }
    }
    return total;
  }

  bool _hasOnePair(int i, int j) {
    /*
     * Check the children for a matched pair around the cog
     * ...
     * .*.
     * ...
     */

    var numbers = 0;
    var minI = max(i - 1, 0);
    var minJ = max(j - 1, 0);
    var maxI = min(i + 2, schematic.length);
    var maxJ = min(j + 2, schematic[i].length);

    for (int x = minI; x < maxI; x++) {
      var currentValue = '';
      for (int y = minJ; y < maxJ; y++) {
        if (int.tryParse(schematic[x][y]) != null) {
          currentValue += schematic[x][y];
        } else if (currentValue.isNotEmpty) {
          currentValue = '';
          numbers++;
        }
      }
      if (currentValue.isNotEmpty) {
        numbers++;
      }
    }

    return numbers == 2;
  }

  int _getGearRatio(int i, int j) {
    // Find the pair of numbers around the cog and get their values multiplied by each other
    var number1 = 0;
    var gapNumber = false;
    var minI = max(i - 1, 0);
    var minJ = max(j - 1, 0);
    var maxI = min(i + 2, schematic.length);
    var maxJ = min(j + 2, schematic[i].length);

    for (int x = minI; x < maxI; x++) {
      for (int y = minJ; y < maxJ; y++) {
        var isNumber = int.tryParse(schematic[x][y]) != null;
        if (isNumber) {
          var fullNumber = _getFullNumber(x, y);
          if (number1 == 0) {
            number1 = fullNumber;
          } else if (gapNumber) {
            return number1 * fullNumber;
          }
        } else {
          if (number1 != 0) {
            gapNumber = true;
          }
        }
      }

      if (number1 != 0) {
        gapNumber = true;
      }
    }

    return 0;
  }

  void _removeCog(int i, int j) {
    schematic[i][j] = '.';
  }

  bool _isValidPartNumber(int i, int j) {
    var minI = max(i - 1, 0);
    var minJ = max(j - 1, 0);
    var maxI = min(i + 2, schematic.length);
    var maxJ = min(j + 2, schematic[i].length);

    for (int x = minI; x < maxI; x++) {
      for (int y = minJ; y < maxJ; y++) {
        var value = schematic[x][y];
        if (int.tryParse(value) == null && value != '.') {
          return true;
        }
      }
    }

    return false;
  }

  int _getGearValue(int i, int j) {
    if (_hasOnePair(i, j)) {
      var ratio = _getGearRatio(i, j);
      // Remove the cog so we don't repeat
      _removeCog(i, j);
      return ratio;
    } else {
      return 0;
    }
  }

  int _getFullNumber(int i, int j) {
    var currentNumber = '';

    for (int y = 0; y < schematic[i].length; y++) {
      var value = schematic[i][y];
      if (int.tryParse(value) != null) {
        currentNumber += value;
      } else if (y > j) {
        return int.parse(currentNumber);
      } else {
        currentNumber = '';
      }
    }

    return int.tryParse(currentNumber) ?? 0;
  }
}
