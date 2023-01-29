import 'package:davi/davi.dart';
import 'package:demoflu/demoflu.dart';
import 'package:flutter/material.dart';

class RowHoverListenerExample extends Example {
  RowHoverListenerExample()
      : super(
            widget: const MainWidget(),
            codeFile: 'lib/examples/row_hover_listener.dart');
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
      DaviColumn(name: 'Name', width: 120, stringValue: (row) => row.name),
      DaviColumn(name: 'Age', width: 120, intValue: (row) => row.age)
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Davi<Person>(_model, onHover: _onHover);
  }

  void _onHover(int? rowIndex) {
    DemoFlu.printOnConsole(context, '$rowIndex');
  }
}
