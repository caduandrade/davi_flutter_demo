import 'package:davi/davi.dart';
import 'package:demoflu/demoflu.dart';
import 'package:flutter/material.dart';

class RowZebraColorExample extends Example {
  RowZebraColorExample()
      : super(
            widget: const MainWidget(),
            codeFile: 'lib/examples/row_zebra_color_example.dart');
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
  late DaviModel<Person> _model;

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
      DaviColumn(name: 'Name', width: 120, cellValue: (row,index) => row.name),
      DaviColumn(name: 'Age', width: 120, cellValue: (row,index) => row.age)
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return DaviTheme(
        data:
            DaviThemeData(row: RowThemeData(color: RowThemeData.zebraColor())),
        child: Davi<Person>(_model));
  }
}
