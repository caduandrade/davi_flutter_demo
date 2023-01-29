import 'package:davi/davi.dart';
import 'package:demoflu/demoflu.dart';
import 'package:flutter/material.dart';

class NullCellColorExample extends Example {
  NullCellColorExample()
      : super(
            widget: const MainWidget(),
            codeFile: 'lib/examples/null_cell_color.dart');
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
  DaviModel<Person>? _model;

  @override
  void initState() {
    super.initState();

    _model = DaviModel<Person>(rows: [
      Person('Landon', '+321 321-432-543'),
      Person('Sari', '+123 456-789-012'),
      Person('Julian', null),
      Person('Carey', '+111 222-333-444'),
      Person('Cadu', null),
      Person('Delmar', '+22 222-222-222')
    ], columns: [
      DaviColumn(name: 'Name', stringValue: (row) => row.name),
      DaviColumn(name: 'Mobile', width: 150, stringValue: (row) => row.mobile)
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return DaviTheme(
        child: Davi<Person>(_model),
        data: DaviThemeData(
            cell: CellThemeData(
                nullValueColor: ((rowIndex, hovered) => Colors.grey[300]))));
  }
}
