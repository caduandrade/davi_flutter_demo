import 'package:davi/davi.dart';
import 'package:flutter/material.dart';

class Person {
  Person(this.name, this.age, this.color);

  final String name;
  final int age;
  final Color color;
}

class RowHoverBackgroundExample extends StatefulWidget {
  const RowHoverBackgroundExample({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => RowHoverBackgroundExampleState();
}

class RowHoverBackgroundExampleState extends State<RowHoverBackgroundExample> {
  late DaviModel<Person> _model;

  @override
  void initState() {
    super.initState();

    List<Person> rows = [
      Person('Landon', 19, Colors.yellow[200]!),
      Person('Sari', 22, Colors.yellow[200]!),
      Person('Julian', 37, Colors.blue[200]!),
      Person('Carey', 39, Colors.green[200]!),
      Person('Cadu', 43, Colors.green[200]!),
      Person('Delmar', 72, Colors.green[200]!)
    ];

    _model = DaviModel<Person>(rows: rows, columns: [
      DaviColumn(name: 'Name', cellValue: (row, index) => row.name),
      DaviColumn(name: 'Age', cellValue: (row, index) => row.age),
      DaviColumn(
          name: 'Color',
          width: 66,
          cellBackground: (row, index, hovered) => row.color)
    ]);
  }

  //@demoflu_start:code
  @override
  Widget build(BuildContext context) {
    return DaviTheme(
        data: DaviThemeData(
            row: RowThemeData(hoverBackground: (rowIndex) => Colors.blue[50])),
        child: Davi<Person>(_model));
  }
  //@demoflu_end:code
}
