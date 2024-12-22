import 'package:davi/davi.dart';
import 'package:flutter/material.dart';

class Person {
  Person(this.name, this.age);

  final String name;
  final int age;
}

class RowFillHeightExample extends StatefulWidget {
  const RowFillHeightExample({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => RowFillHeightExampleState();
}

class RowFillHeightExampleState extends State<RowFillHeightExample> {
  late DaviModel<Person> _model;

  @override
  void initState() {
    super.initState();

    List<Person> rows = [
      Person('Landon', 19),
      Person('Carey', 39),
      Person('Cadu', 43)
    ];

    _model = DaviModel<Person>(rows: rows, columns: [
      DaviColumn(name: 'Name', cellValue: (row, index) => row.name),
      DaviColumn(name: 'Age', cellValue: (row, index) => row.age)
    ]);
  }

  //@demoflu_start:code
  @override
  Widget build(BuildContext context) {
    return DaviTheme(
        data: DaviThemeData(
            row: RowThemeData(
                fillHeight: true, color: RowThemeData.zebraColor())),
        child: Davi<Person>(_model));
  }
  //@demoflu_end:code
}
