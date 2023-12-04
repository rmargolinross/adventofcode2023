import 'package:flutter/material.dart';

import 'day1/day1_page.dart';
import 'day10/day10_page.dart';
import 'day11/day11_page.dart';
import 'day12/day12_page.dart';
import 'day13/day13_page.dart';
import 'day14/day14_page.dart';
import 'day15/day15_page.dart';
import 'day16/day16_page.dart';
import 'day17/day17_page.dart';
import 'day18/day18_page.dart';
import 'day19/day19_page.dart';
import 'day2/day2_page.dart';
import 'day20/day20_page.dart';
import 'day21/day21_page.dart';
import 'day22/day22_page.dart';
import 'day23/day23_page.dart';
import 'day24/day24_page.dart';
import 'day25/day25_page.dart';
import 'day3/day3_page.dart';
import 'day4/day4_page.dart';
import 'day5/day5_page.dart';
import 'day6/day6_page.dart';
import 'day7/day7_page.dart';
import 'day8/day8_page.dart';
import 'day9/day9_page.dart';
import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        secondaryHeaderColor: Colors.green,
      ),
      routes: routes,
      initialRoute: '/',
    );
  }
}

Map<String, Widget Function(dynamic context)> routes = {
  '/': (context) => const HomePage(title: 'Advent of Code 2022'),
  '/day1': (context) => const Day1Page(),
  '/day2': (context) => const Day2Page(),
  '/day3': (context) => const Day3Page(),
  '/day4': (context) => const Day4Page(),
  '/day5': (context) => const Day5Page(),
  '/day6': (context) => const Day6Page(),
  '/day7': (context) => const Day7Page(),
  '/day8': (context) => const Day8Page(),
  '/day9': (context) => const Day9Page(),
  '/day10': (context) => const Day10Page(),
  '/day11': (context) => const Day11Page(),
  '/day12': (context) => const Day12Page(),
  '/day13': (context) => const Day13Page(),
  '/day14': (context) => const Day14Page(),
  '/day15': (context) => const Day15Page(),
  '/day16': (context) => const Day16Page(),
  '/day17': (context) => const Day17Page(),
  '/day18': (context) => const Day18Page(),
  '/day19': (context) => const Day19Page(),
  '/day20': (context) => const Day20Page(),
  '/day21': (context) => const Day21Page(),
  '/day22': (context) => const Day22Page(),
  '/day23': (context) => const Day23Page(),
  '/day24': (context) => const Day24Page(),
  '/day25': (context) => const Day25Page(),
};
