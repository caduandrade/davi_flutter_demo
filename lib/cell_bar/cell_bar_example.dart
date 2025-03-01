import 'package:davi/davi.dart';
import 'package:flutter/material.dart';

class Person {
  Person(this.name, this.achievement);

  final String name;
  final double achievement;
}

class CellBarExample extends StatefulWidget {
  const CellBarExample({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => CellBarExampleState();
}

class CellBarExampleState extends State<CellBarExample> {
  late DaviModel<Person> _model;

  @override
  void initState() {
    super.initState();
    List<Person> rows = [
      Person('Landon', 1),
      Person('Sari', 0.4),
      Person('Julian', 0.2),
      Person('Carey', 0.35),
      Person('Cadu', 0.85),
      Person('Delmar', 0.3)
    ];

    _model = DaviModel(rows: rows, columns: [
      DaviColumn(name: 'Name', cellValue: (params) => params.data.name),
      //@demoflu_start:code
      DaviColumn(
          cellPadding: EdgeInsets.all(4),
          name: 'Achievement',
          width: 150,
          cellBarValue: (params) => params.data.achievement)
      //@demoflu_end:code
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Davi<Person>(_model, visibleRowsCount: 6);
  }
}
