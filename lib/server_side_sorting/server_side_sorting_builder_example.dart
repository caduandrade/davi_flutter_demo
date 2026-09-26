import 'package:davi/davi.dart';
import 'package:flutter/material.dart';

class Person {
  Person(this.name, this.age);

  final String name;
  final int age;
}

enum ColumnId { name, age }

/// Simulates the server, returning the rows already sorted.
Future<List<Person>> fetchPeople(DaviSort? sort) {
  return Future.delayed(const Duration(seconds: 1), () {
    List<Person> rows = [
      Person('Linda', 33),
      Person('Pamela', 22),
      Person('Steven', 21),
      Person('James', 37),
      Person('Amanda', 43),
      Person('Cadu', 35)
    ];
    if (sort != null) {
      final int direction =
          sort.direction == DaviSortDirection.ascending ? 1 : -1;
      rows.sort((a, b) {
        switch (sort.columnId) {
          case ColumnId.name:
            return direction * a.name.compareTo(b.name);
          case ColumnId.age:
            return direction * a.age.compareTo(b.age);
        }
        return 0;
      });
    }
    return rows;
  });
}

class ServerSideSortingBuilderExample extends StatefulWidget {
  const ServerSideSortingBuilderExample({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ServerSideSortingBuilderExampleState();
}

class ServerSideSortingBuilderExampleState
    extends State<ServerSideSortingBuilderExample> {
  final DaviController<Person> _controller = DaviController(columns: [
    DaviColumn(
        id: ColumnId.name,
        name: 'Name',
        cellValue: (params) => params.data.name),
    DaviColumn(
        id: ColumnId.age, name: 'Age', cellValue: (params) => params.data.age)
  ]);

  List<Person> _rows = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadData(null);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _loadData(DaviSort? sort) {
    fetchPeople(sort).then((rows) {
      if (mounted) {
        setState(() {
          _loading = false;
          _rows = rows;
        });
      }
    });
  }

  /// Called when the header is tapped. The controller already shows the
  /// requested sort, the rows must be sorted by the server.
  void _onSort(List<DaviColumn<Person>> sortedColumns) {
    setState(() {
      _loading = true;
    });
    if (sortedColumns.isNotEmpty) {
      final DaviColumn<Person> column = sortedColumns.first;
      _loadData(DaviSort(column.id, column.sortDirection!));
    } else {
      _loadData(null);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Davi<Person>.builder(
        controller: _controller,
        rows: _rows,
        onSort: _onSort,
        placeholderWidget:
            _loading ? const Center(child: Text('Loading...')) : null);
  }
}
