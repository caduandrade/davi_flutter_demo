import 'package:davi/davi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Person {
  Person(this.name, this.age);

  final String name;
  final int age;
}

class ServerSideSortingExample extends StatefulWidget {
  const ServerSideSortingExample({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ServerSideSortingExampleState();
}

enum ColumnId { name, age }

class ServerSideSortingExampleState extends State<ServerSideSortingExample> {
  late DaviModel<Person> _model;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _model = DaviModel(columns: [
      DaviColumn(
          id: ColumnId.name,
          name: 'Name',
          cellValue: (row, rowIndex) => row.name),
      DaviColumn(
          id: ColumnId.age, name: 'Age', cellValue: (row, rowIndex) => row.age)
    ], onSort: _onSort, ignoreDataComparators: true);
    loadData();
  }

  /// Simulates data being loaded from the server
  void loadData([DaviSort? sort]) {
    Future<List<Person>>.delayed(const Duration(seconds: 1), () {
      List<Person> rows = [
        Person('Linda', 33),
        Person('Pamela', 22),
        Person('Steven', 21),
        Person('James', 37),
        Person('Amanda', 43),
        Person('Cadu', 35)
      ];
      if (sort != null) {
        final DaviSortDirection direction = sort.direction;
        rows.sort((a, b) {
          switch (sort.columnId) {
            case ColumnId.name:
              return direction == DaviSortDirection.ascending
                  ? a.name.compareTo(b.name)
                  : b.name.compareTo(a.name);
            case ColumnId.age:
              return direction == DaviSortDirection.ascending
                  ? a.age.compareTo(b.age)
                  : b.age.compareTo(a.age);
          }
          return 0;
        });
      }
      return rows;
    }).then((list) {
      if (mounted) {
        setState(() {
          _loading = false;
          _model.replaceRows(list);
        });
      }
    });
  }

  void _onSort(List<DaviColumn<Person>> sortedColumns) {
    setState(() {
      _loading = true;
    });
    if (sortedColumns.isNotEmpty) {
      loadData(
          DaviSort(sortedColumns.first.id, sortedColumns.first.sortDirection!));
    } else {
      loadData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Davi(_model,
        placeholderWidget:
            _loading ? const Center(child: Text('Loading...')) : null);
  }
}
