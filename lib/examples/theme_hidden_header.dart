import 'package:davi/davi.dart';
import 'package:demoflu/demoflu.dart';
import 'package:flutter/material.dart';

class ThemeHiddenHeaderExample extends Example {
  ThemeHiddenHeaderExample()
      : super(
            widget: const MainWidget(),
            codeFile: 'lib/examples/theme_hidden_header.dart');
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
      DaviColumn(
          name: '',
          pinStatus: PinStatus.left,
          width: 30,
          cellBuilder: (context, data) => const Icon(Icons.edit, size: 16)),
      DaviColumn(name: 'Name', stringValue: (row) => row.name),
      DaviColumn(name: 'Age', intValue: (row) => row.age)
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return DaviTheme(
        child: Davi<Person>(_model),
        data: const DaviThemeData(header: HeaderThemeData(visible: false)));
  }
}
