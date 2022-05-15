import 'package:demoflu/demoflu.dart';
import 'package:easy_table/easy_table.dart';
import 'package:flutter/material.dart';

class ColumnStyleExample extends Example {
  @override
  Widget buildMainWidget(BuildContext context) => const MainWidget();
}

class Person {
  Person(this.name, this.age);

  final String name;
  final int age;
}

class MainWidget extends StatefulWidget {
  const MainWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MainWidgetState();
}

class MainWidgetState extends State<MainWidget> {
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
      EasyTableColumn(name: 'Name', width: 120, stringValue: (row) => row.name),
      EasyTableColumn(
          name: 'Age',
          width: 120,
          intValue: (row) => row.age,
          headerTextStyle: TextStyle(color: Colors.blue[900]!),
          headerAlignment: Alignment.center,
          cellAlignment: Alignment.center,
          cellTextStyle: TextStyle(color: Colors.blue[700]!))
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return EasyTable<Person>(_model);
  }
}
