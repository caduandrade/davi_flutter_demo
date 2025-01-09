import 'package:davi/davi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Person {
  Person(this.name, this.age);

  final String name;
  final int age;
}

class OnSortExample extends StatefulWidget {
  const OnSortExample({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => OnSortExampleState();
}

class OnSortExampleState extends State<OnSortExample> {
  late DaviModel<Person> _model;

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
    _model = DaviModel(
        rows: rows,
        columns: [
          DaviColumn(name: 'Name', cellValue: (row, rowIndex) => row.name),
          DaviColumn(name: 'Age', cellValue: (row, rowIndex) => row.age)
        ],
        onSort: _onSort);
  }

  void _onSort(List<DaviColumn<Person>> sortedColumns) {
    setState(() {
      if (sortedColumns.isEmpty) {
        _sortedBy = 'natural ordering';
      } else {
        final DaviColumn<Person> column = sortedColumns.first;

        _sortedBy = 'sorted by ${column.name} / ${column.sortDirection!.name}';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Padding(
          padding: const EdgeInsets.all(8),
          child: Text(_sortedBy, textAlign: TextAlign.center)),
      Expanded(child: Davi(_model))
    ]);
  }
}
