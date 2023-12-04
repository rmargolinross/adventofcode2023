import 'package:adventofcode2022/common/widgets/day_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        primary: true,
        shrinkWrap: true,
        prototypeItem:
            const DayButton(title: 'Day 1', path: '/day1', enabled: false),
        children: const [
          DayButton(title: 'Day 1', path: '/day1', enabled: true),
          DayButton(title: 'Day 2', path: '/day2', enabled: true),
          DayButton(title: 'Day 3', path: '/day3', enabled: true),
          DayButton(title: 'Day 4', path: '/day4', enabled: true),
          DayButton(title: 'Day 5', path: '/day5', enabled: true),
          DayButton(title: 'Day 6', path: '/day6', enabled: true),
          DayButton(title: 'Day 7', path: '/day7', enabled: true),
          DayButton(title: 'Day 8', path: '/day8', enabled: true),
          DayButton(title: 'Day 9', path: '/day9', enabled: true),
          DayButton(title: 'Day 10', path: '/day10', enabled: true),
          DayButton(title: 'Day 11', path: '/day11', enabled: true),
          DayButton(title: 'Day 12', path: '/day12', enabled: true),
          DayButton(title: 'Day 13', path: '/day13', enabled: true),
          DayButton(title: 'Day 14', path: '/day14', enabled: true),
          DayButton(title: 'Day 15', path: '/day15', enabled: true),
          DayButton(title: 'Day 16', path: '/day16', enabled: true),
          DayButton(title: 'Day 17', path: '/day17', enabled: true),
          DayButton(title: 'Day 18', path: '/day18', enabled: true),
          DayButton(title: 'Day 19', path: '/day19', enabled: true),
          DayButton(title: 'Day 20', path: '/day20', enabled: true),
          DayButton(title: 'Day 21', path: '/day21', enabled: true),
          DayButton(title: 'Day 22', path: '/day22', enabled: true),
          DayButton(title: 'Day 23', path: '/day23', enabled: true),
          DayButton(title: 'Day 24', path: '/day24', enabled: true),
          DayButton(title: 'Day 25', path: '/day25', enabled: true),
        ],
      ),
    );
  }
}
