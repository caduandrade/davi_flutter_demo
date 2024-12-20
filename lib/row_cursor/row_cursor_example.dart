import 'package:davi/davi.dart';
import 'package:flutter/material.dart';

class Person {
  Person(this.name, this.age);

  final String name;
  final int age;
}

class RowCursorExample extends StatefulWidget {
  const RowCursorExample({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => RowCursorExampleState();
}

class RowCursorExampleState extends State<RowCursorExample> {
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
      DaviColumn(name: 'Age', cellValue: (row, index) => row.age)
    ]);
  }

  //@demoflu_start:code
  @override
  Widget build(BuildContext context) {
    return Davi<Person>(_model, rowCursor: _rowCursor);
  }

  MouseCursor? _rowCursor(Person person, int index, bool hovered) =>
      person.age < 20 ? SystemMouseCursors.forbidden : null;
  //@demoflu_end:code
}
