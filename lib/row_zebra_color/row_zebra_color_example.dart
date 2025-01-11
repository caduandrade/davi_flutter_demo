import 'package:davi/davi.dart';
import 'package:flutter/material.dart';

class Person {
  Person(this.name, this.age);

  final String name;
  final int age;
}

class RowZebraColorExample extends StatefulWidget {
  const RowZebraColorExample({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => RowZebraColorExampleState();
}

class RowZebraColorExampleState extends State<RowZebraColorExample> {
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

    _model = DaviModel(rows: rows, columns: [
      DaviColumn(
          name: 'Name', width: 120, cellValue: (params) => params.data.name),
      DaviColumn(
          name: 'Age', width: 120, cellValue: (params) => params.data.age)
    ]);
  }

  //@demoflu_start:code
  @override
  Widget build(BuildContext context) {
    return DaviTheme(
        data:
            DaviThemeData(row: RowThemeData(color: RowThemeData.zebraColor())),
        child: Davi<Person>(_model));
  }
  //@demoflu_end:code
}
