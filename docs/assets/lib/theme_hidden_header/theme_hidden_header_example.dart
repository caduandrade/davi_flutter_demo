import 'package:davi/davi.dart';
import 'package:flutter/material.dart';

class Person {
  Person(this.name, this.age);

  final String name;
  final int age;
}

class ThemeHiddenHeaderExample extends StatefulWidget {
  const ThemeHiddenHeaderExample({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ThemeHiddenHeaderExampleState();
}

class ThemeHiddenHeaderExampleState extends State<ThemeHiddenHeaderExample> {
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

    _model = DaviModel(rows: rows, columns: [
      DaviColumn(name: 'Name', cellValue: (params) => params.data.name),
      DaviColumn(name: 'Age', cellValue: (params) => params.data.age)
    ]);
  }

  //@demoflu_start:code
  @override
  Widget build(BuildContext context) {
    return DaviTheme(
        data: const DaviThemeData(header: HeaderThemeData(visible: false)),
        child: Davi<Person>(_model));
  }
//@demoflu_end:code
}
