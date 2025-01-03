import 'package:davi/davi.dart';
import 'package:flutter/material.dart';

class Person {
  Person(this.name, this.age);

  final String name;
  final int age;
}

class ColumnStyleExample extends StatefulWidget {
  const ColumnStyleExample({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ColumnStyleExampleState();
}

class ColumnStyleExampleState extends State<ColumnStyleExample> {
  late DaviModel<Person> _model;

  @override
  void initState() {
    super.initState();

    List<Person> rows = [
      Person('Landon', 19),
      Person('Sari', 22),
      Person('Julian', 37),
      Person('Carey', 39),
      Person('Cadu', 43),
      Person('Delmar', 72)
    ];

    _model = DaviModel<Person>(rows: rows, columns: [
      DaviColumn(name: 'Name', cellValue: (row, index) => row.name),
      //@demoflu_start:model
      DaviColumn(
          name: 'Age',
          cellValue: (row, index) => row.age,
          headerTextStyle: TextStyle(color: Colors.blue[900]!),
          headerAlignment: Alignment.center,
          cellAlignment: Alignment.center,
          cellTextStyle: (row, index, hovered) =>
              TextStyle(color: Colors.blue[700]!),
          cellBackground: (row, index, hovered) => Colors.blue[50])
      //@demoflu_end:model
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Davi<Person>(_model);
  }
}
