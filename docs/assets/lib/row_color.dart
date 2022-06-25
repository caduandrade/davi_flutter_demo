import 'package:demoflu/demoflu.dart';
import 'package:easy_table/easy_table.dart';
import 'package:flutter/material.dart';

class RowColorExample extends Example {
  @override
  Widget buildMainWidget(BuildContext context) => const ExampleWidget();
}

class Person {
  Person(this.name, this.age);

  final String name;
  final int age;
}

class ExampleWidget extends StatefulWidget {
  const ExampleWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ExampleWidgetState();
}

class ExampleWidgetState extends State<ExampleWidget> {
  EasyTableModel<Person>? _model;

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

    _model = EasyTableModel<Person>(rows: rows, columns: [
      EasyTableColumn(name: 'Name', stringValue: (row) => row.name),
      EasyTableColumn(name: 'Age', intValue: (row) => row.age)
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return EasyTable<Person>(_model, rowColor: _rowColor);
  }

  Color? _rowColor(RowData<Person> data) {
    if (data.row.age < 20) {
      return Colors.green[50]!;
    } else if (data.row.age > 30 && data.row.age < 50) {
      return Colors.orange[50]!;
    }
    return null;
  }
}
