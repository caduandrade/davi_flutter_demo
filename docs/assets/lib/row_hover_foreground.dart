import 'package:demoflu/demoflu.dart';
import 'package:easy_table/easy_table.dart';
import 'package:flutter/material.dart';

class RowHoverForegroundExample extends Example {
  @override
  Widget buildMainWidget(BuildContext context) => const MainWidget();
}

class Person {
  Person(this.name, this.age, this.color);

  final String name;
  final int age;
  final Color color;
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
      Person('Landon', 19, Colors.yellow[200]!),
      Person('Sari', 22, Colors.yellow[200]!),
      Person('Julian', 37, Colors.blue[200]!),
      Person('Carey', 39, Colors.green[200]!),
      Person('Cadu', 43, Colors.green[200]!),
      Person('Delmar', 72, Colors.green[200]!)
    ];

    _model = EasyTableModel<Person>(rows: rows, columns: [
      EasyTableColumn(name: 'Name', stringValue: (row) => row.name),
      EasyTableColumn(name: 'Age', intValue: (row) => row.age),
      EasyTableColumn(
          name: 'Color', width: 66, cellBackground: (data) => data.row.color)
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return EasyTableTheme(
        data: EasyTableThemeData(
            row: RowThemeData(
                hoverForeground: (rowIndex) => Colors.blue.withOpacity(.2))),
        child: EasyTable<Person>(_model));
  }
}
