import 'package:davi/davi.dart';
import 'package:demoflu/demoflu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ScrollbarAlwaysVisibleExample extends Example {
  ScrollbarAlwaysVisibleExample()
      : super(
            widget: const MainWidget(),
            codeFile: 'lib/examples/scrollbar_always_visible.dart');
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
      Person('Cadu', 43)
    ];
    _model = DaviModel<Person>(rows: rows, columns: [
      DaviColumn(name: 'Name', stringValue: (row) => row.name),
      DaviColumn(name: 'Age', intValue: (row) => row.age)
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return DaviTheme(
        data: const DaviThemeData(
            scrollbar: TableScrollbarThemeData(
                horizontalOnlyWhenNeeded: false,
                verticalOnlyWhenNeeded: false)),
        child: Davi<Person>(_model));
  }
}
