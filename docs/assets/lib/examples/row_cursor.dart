import 'package:davi/davi.dart';
import 'package:demoflu/demoflu.dart';
import 'package:flutter/material.dart';

class RowCursorExample extends Example {
  RowCursorExample()
      : super(
            widget: const ExampleWidget(),
            codeFile: 'lib/examples/row_cursor.dart');
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
  DaviModel<Person>? _model;

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

    _model = DaviModel<Person>(rows: rows, columns: [
      DaviColumn(name: 'Name', stringValue: (row) => row.name),
      DaviColumn(name: 'Age', intValue: (row) => row.age)
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return DaviTheme(
        child: Davi<Person>(_model,
            rowCursor: (row) =>
                row.data.age < 20 ? SystemMouseCursors.forbidden : null),
        data: const DaviThemeData(
            row: RowThemeData(cursorOnTapGesturesOnly: false)));
  }
}
