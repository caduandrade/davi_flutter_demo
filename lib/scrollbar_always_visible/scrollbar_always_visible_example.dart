import 'dart:math';

import 'package:davi/davi.dart';
import 'package:demoflu/demoflu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Person {
  Person(this.name, this.age);

  final String name;
  final int age;
}

class ScrollbarAlwaysVisibleExample extends StatefulWidget {
  const ScrollbarAlwaysVisibleExample({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ScrollbarAlwaysVisibleExampleState();
}

class ScrollbarAlwaysVisibleExampleState
    extends State<ScrollbarAlwaysVisibleExample> {
  late DaviModel<int> _model;

  @override
  void initState() {
    super.initState();
    Random random = Random();
    List<int> rows = List.generate(5, (index) => random.nextInt(999));
    _model = DaviModel(
        rows: rows,
        columns: List.generate(
            3,
            (index) => DaviColumn(
                name: 'C$index', cellValue: (row, rowIndex) => row + index)));
  }

  //@demoflu_start:code
  @override
  Widget build(BuildContext context) {
    return DaviTheme(
        data: const DaviThemeData(
            scrollbar: TableScrollbarThemeData(
                horizontalOnlyWhenNeeded: false,
                verticalOnlyWhenNeeded: false)),
        child: Davi<int>(_model));
  }
  //@demoflu_end:code
}
