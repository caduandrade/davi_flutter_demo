import 'package:davi/davi.dart';
import 'package:demoflu/demoflu.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OnSortExample extends Example {
  OnSortExample()
      : super(
            widget: const MainWidget(), codeFile: 'lib/examples/on_sort.dart');
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
  DaviModel<Person>? _model;

  String _sortedBy = 'natural ordering';

  @override
  void initState() {
    super.initState();
    List<Person> rows = [
      Person('Carolyn', 22),
      Person('Cornell', 22),
      Person('Christine', 37),
      Person('Carey', 37),
      Person('Cadu', 43),
      Person('Catherine', 43)
    ];
    _model = DaviModel<Person>(
        rows: rows,
        columns: [
          DaviColumn(name: 'Name', stringValue: (row) => row.name),
          DaviColumn(name: 'Age', intValue: (row) => row.age)
        ],
        onSort: _onSort);
  }

  void _onSort(List<DaviColumn<Person>> sortedColumns) {
    setState(() {
      if (sortedColumns.isEmpty) {
        _sortedBy = 'natural ordering';
      } else {
        final DaviColumn<Person> column = sortedColumns.first;

        _sortedBy = 'sorted by ${column.name} / ${describeEnum(column.order!)}';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
          padding: const EdgeInsets.all(8),
          child: Text(_sortedBy, textAlign: TextAlign.center)),
      Expanded(child: Davi(_model))
    ], crossAxisAlignment: CrossAxisAlignment.stretch);
  }
}
