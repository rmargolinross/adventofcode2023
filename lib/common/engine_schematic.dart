import 'dart:math';

import 'package:flutter/material.dart';

class EngineSchematic {
  final List<List<String>> schematic;

  EngineSchematic(this.schematic);

  EngineSchematic.fromString(String schematicString)
      : schematic = schematicString
            .split('\n')
            .map((row) => row.characters.toList())
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
      var currentNumber = '';
      var validGear = false;
      var validGearValue = 0;
      var row = schematic[i];

      for (int j = 0; j < row.length; j++) {
        // Loop through and find if a number is a gear (we need only look down and right)
        var currentValue = int.tryParse(row[j]);
        if (currentValue != null) {
          currentNumber += row[j];
          var gearValue = _getGearValue(i, j);
          if (gearValue > 0) {
            validGear = true;
            validGearValue = gearValue;
          }
        } else {
          if (validGear) {
            total += int.parse(currentNumber) * validGearValue;
          }
          validGear = false;
          validGearValue = 0;
          currentNumber = '';
        }
      }
    }
    return total;
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
    var gearValue = 0;

    var maxI = min(i + 2, schematic.length);
    var minJ = max(j - 1, 0);
    var maxJ = min(j + 2, schematic[i].length);
    var gearLocationX = 0;
    var gearLocationY = 0;

    for (int x = i; x < maxI; x++) {
      for (int y = minJ; y < maxJ; y++) {
        var value = schematic[x][y];
        if (value == '*') {
          gearLocationX = x;
          gearLocationY = y;
          break;
        }
      }
    }

    maxI = min(gearLocationX + 2, schematic.length);
    minJ = max(gearLocationY - 1, 0);
    maxJ = min(gearLocationY + 2, schematic[i].length);

    for (int x = gearLocationX; x < maxI; x++) {
      for (int y = minJ; y < maxJ; y++) {
        var value = schematic[x][y];
        if (int.tryParse(value) != null) {
          // Found a number for the gear now traverse this row to find the full number
          gearValue = _getFullNumber(x, y);
          break;
        }
      }
    }

    return gearValue;
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

    return 0;
  }
}
