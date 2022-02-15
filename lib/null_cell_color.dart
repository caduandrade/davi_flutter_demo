import 'package:demoflu/demoflu.dart';
import 'package:easy_table/easy_table.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NullCellColorExample extends Example {
  @override
  Widget buildMainWidget(BuildContext context) => const MainWidget();
}

class Person {
  Person(this.name, this.mobile);

  final String name;
  final String? mobile;
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

    _model = EasyTableModel<Person>(rows: [
      Person('Landon', '+321 321-432-543'),
      Person('Sari', '+123 456-789-012'),
      Person('Julian', null),
      Person('Carey', '+111 222-333-444'),
      Person('Cadu', null),
      Person('Delmar', '+22 222-222-222')
    ], columns: [
      EasyTableColumn(name: 'Name', width: 120, stringValue: (row) => row.name),
      EasyTableColumn(
          name: 'Mobile', width: 150, stringValue: (row) => row.mobile)
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return EasyTableTheme(
        child: EasyTable<Person>(_model),
        data: EasyTableThemeData(
            nullCellColor: ((rowIndex) => Colors.grey[300])));
  }
}
