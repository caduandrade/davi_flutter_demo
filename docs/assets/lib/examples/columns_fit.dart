import 'package:davi/davi.dart';
import 'package:demoflu/demoflu.dart';
import 'package:flutter/widgets.dart';

class ColumnsFitExample extends Example {
  ColumnsFitExample()
      : super(
            widget: const MainWidget(),
            codeFile: 'lib/examples/columns_fit.dart');
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
      DaviColumn(name: 'Name', grow: 2, stringValue: (row) => row.name),
      DaviColumn(name: 'Age', grow: 1, intValue: (row) => row.age)
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Davi<Person>(_model, columnWidthBehavior: ColumnWidthBehavior.fit);
  }
}
