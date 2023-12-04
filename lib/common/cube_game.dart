import 'dart:math';

class CubeGame {
  final int redCubes;
  final int blueCubes;
  final int greenCubes;

  CubeGame(this.redCubes, this.blueCubes, this.greenCubes);

  int getPossibleGames(List<String> games) {
    var total = 0;

    var plays = games.map((e) => CubeGamePlay.fromString(e)).toList();
    for (var play in plays) {
      var passed = true;
      for (var draw in play.draws) {
        if (draw[Color.blue]! > blueCubes ||
            draw[Color.red]! > redCubes ||
            draw[Color.green]! > greenCubes) {
          passed = false;
          break;
        }
      }

      if (passed) {
        total += play.playNumber;
      }
    }

    return total;
  }

  int getPowerOfGames(List<String> games) {
    var power = 0;

    var plays = games.map((e) => CubeGamePlay.fromString(e)).toList();
    for (var play in plays) {
      var maxBlue = 0;
      var maxGreen = 0;
      var maxRed = 0;
      for (var draw in play.draws) {
        maxBlue = max(maxBlue, draw[Color.blue] ?? 0);
        maxGreen = max(maxGreen, draw[Color.green] ?? 0);
        maxRed = max(maxRed, draw[Color.red] ?? 0);
      }

      power += (maxBlue * maxGreen * maxRed);
    }

    return power;
  }
}

class CubeGamePlay {
  final int playNumber;
  late List<Map<Color, int>> draws;

  CubeGamePlay(this.playNumber, this.draws);

  CubeGamePlay.fromString(String playString)
      : playNumber = int.parse(playString.split(':')[0].substring(5)) {
    var values = playString.split(':')[1].split(';');
    List<Map<Color, int>> results = [];

    for (var draw in values) {
      var blue = 0;
      var green = 0;
      var red = 0;
      draw.split(',').forEach((cubes) {
        var value = cubes.trim().split(' ')[0];
        var color = cubes.trim().split(' ')[1];
        switch (color) {
          case 'red':
            red = int.parse(value);
            break;
          case 'blue':
            blue = int.parse(value);
            break;
          case 'green':
            green = int.parse(value);
            break;
        }
      });
      results.add({
        Color.blue: blue,
        Color.red: red,
        Color.green: green,
      });
    }

    draws = results;
  }
}

enum Color {
  blue,
  green,
  red;
}
