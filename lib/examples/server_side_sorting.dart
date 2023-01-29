import 'package:davi/davi.dart';
import 'package:demoflu/demoflu.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ServerSideSortingExample extends Example {
  ServerSideSortingExample()
      : super(
            widget: const MainWidget(),
            codeFile: 'lib/examples/server_side_sorting.dart');
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

enum ColumnId { name, age }

class MainWidgetState extends State<MainWidget> {
  late DaviModel<Person> _model;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _model = DaviModel<Person>(columns: [
      DaviColumn(
          id: ColumnId.name, name: 'Name', stringValue: (row) => row.name),
      DaviColumn(id: ColumnId.age, name: 'Age', intValue: (row) => row.age)
    ], onSort: _onSort, ignoreSort: true);
    loadData();
  }

  void loadData([DaviColumn<Person>? column]) {
    Future<List<Person>>.delayed(const Duration(seconds: 1), () {
      List<Person> rows = [
        Person('Linda', 33),
        Person('Pamela', 22),
        Person('Steven', 21),
        Person('James', 37),
        Person('Amanda', 43),
        Person('Cadu', 35)
      ];
      if (column != null) {
        final TableSortOrder order = column.order!;
        rows.sort((a, b) {
          switch (column.id) {
            case ColumnId.name:
              return order == TableSortOrder.ascending
                  ? a.name.compareTo(b.name)
                  : b.name.compareTo(a.name);
            case ColumnId.age:
              return order == TableSortOrder.ascending
                  ? a.age.compareTo(b.age)
                  : b.age.compareTo(a.age);
          }
          return 0;
        });
      }
      return rows;
    }).then((list) {
      setState(() {
        _loading = false;
        _model.replaceRows(list);
      });
    });
  }

  void _onSort(List<DaviColumn<Person>> sortedColumns) {
    setState(() {
      _loading = true;
      _model.removeRows();
    });
    final DaviColumn<Person>? column =
        sortedColumns.isNotEmpty ? sortedColumns.first : null;
    loadData(column);
  }

  @override
  Widget build(BuildContext context) {
    return Davi(_model,
        tapToSortEnabled: !_loading,
        lastRowWidget:
            _loading ? const Center(child: Text('Loading...')) : null);
  }
}
