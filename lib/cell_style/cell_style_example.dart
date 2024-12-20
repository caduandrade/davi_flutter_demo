import 'package:davi/davi.dart';
import 'package:demoflu/demoflu.dart';
import 'package:flutter/material.dart';

class CellStyleExample extends Example {
  CellStyleExample()
      : super(
            widget: const MainWidget(),
            codeFile: 'lib/examples/cell_style_example.dart');
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
      DaviColumn(name: 'Name', cellValue: (row,index) => row.name),
      DaviColumn(
          name: 'Age',
          cellValue: (row,index) => row.age,
          cellStyleBuilder: (row) => row.data.age >= 30 && row.data.age < 40
              ? CellStyle(
                  background: Colors.blue[800],
                  alignment: Alignment.center,
                  textStyle: const TextStyle(color: Colors.white))
              : null)
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Davi<Person>(_model);
  }
}
