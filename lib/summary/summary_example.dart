import 'package:davi/davi.dart';
import 'package:flutter/material.dart';

class Person {
  Person(this.name, this.value);

  final String name;
  final int value;
}

class SummaryExample extends StatefulWidget {
  const SummaryExample({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SummaryExampleState();
}

class SummaryExampleState extends State<SummaryExample> {
  late DaviModel<Person> _model;

  @override
  void initState() {
    super.initState();
    List<Person> rows = [
      Person('Landon', 1),
      Person('Sari', 1),
      Person('Julian', 2),
      Person('Carey', 2),
      Person('Cadu', 2),
      Person('Delmar', 2)
    ];

    //@demoflu_start:1
    _model = DaviModel(rows: rows, columns: [
      DaviColumn(name: 'Name', cellValue: (params) => params.data.name),
      DaviColumn(
          cellPadding: EdgeInsets.all(4),
          name: 'Value',
          cellValue: (params) => params.data.value,
          summary: (context) => Text('$_valueSum'))
    ]);
    //@demoflu_end:1
  }

  //@demoflu_start:2
  int get _valueSum => _model.rows.fold(0, (sum, row) => sum + row.value);

  //@demoflu_end:2

  @override
  Widget build(BuildContext context) {
    return Davi<Person>(_model, visibleRowsCount: 6);
  }
}
