import 'package:davi/davi.dart';
import 'package:demoflu/demoflu.dart';
import 'package:flutter/material.dart';

class RowHoverBackgroundExample extends Example {
  RowHoverBackgroundExample()
      : super(
            widget: const MainWidget(),
            codeFile: 'lib/examples/row_hover_background.dart');
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
  DaviModel<Person>? _model;

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

    _model = DaviModel<Person>(rows: rows, columns: [
      DaviColumn(name: 'Name', stringValue: (row) => row.name),
      DaviColumn(name: 'Age', intValue: (row) => row.age),
      DaviColumn(
          name: 'Color', width: 66, cellBackground: (row) => row.data.color)
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return DaviTheme(
        data: DaviThemeData(
            row: RowThemeData(hoverBackground: (rowIndex) => Colors.blue[50])),
        child: Davi<Person>(_model));
  }
}
