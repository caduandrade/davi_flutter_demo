import 'dart:math';

import 'package:davi/davi.dart';
import 'package:flutter/material.dart';

class ThemeScrollbarsExample extends StatefulWidget {
  const ThemeScrollbarsExample({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ThemeScrollbarsExampleState();
}

class ThemeScrollbarsExampleState extends State<ThemeScrollbarsExample> {
  late DaviModel<int> _model;

  @override
  void initState() {
    super.initState();

    Random random = Random();
    List<int> rows = List.generate(100, (index) => random.nextInt(999));
    _model = DaviModel<int>(
        rows: rows,
        columns: List.generate(
            10,
            (index) => DaviColumn(
                name: 'C$index', cellValue: (row, rowIndex) => row + index)));
  }

  //@demoflu_start:code
  @override
  Widget build(BuildContext context) {
    return DaviTheme(
        data: const DaviThemeData(
            scrollbar: TableScrollbarThemeData(
                thickness: 16,
                thumbColor: Colors.black,
                pinnedHorizontalColor: Colors.yellow,
                unpinnedHorizontalColor: Colors.green,
                verticalColor: Colors.blue,
                borderThickness: 8,
                pinnedHorizontalBorderColor: Colors.orange,
                unpinnedHorizontalBorderColor: Colors.purple,
                verticalBorderColor: Colors.pink)),
        child: Davi<int>(_model));
  }
  //@demoflu_end:code
}
