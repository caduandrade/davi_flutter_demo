import 'package:davi/davi.dart';
import 'package:flutter/widgets.dart';

class Person {
  Person(this.name, this.age);

  final String name;
  final int age;
}

class Example extends StatefulWidget {
  const Example({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ExampleState();
}

class ExampleState extends State<Example> {

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

    //@demoflu_start:model
    _model = DaviModel<Person>(rows: rows, columns: [
      DaviColumn(name: 'Name', grow: 2, cellValue: (person, index) => person.name),
      DaviColumn(name: 'Age', grow: 1, cellValue: (person, index) => person.age)
    ]);
    //@demoflu_end:model
  }

  //@demoflu_start:davi
  @override
  Widget build(BuildContext context) {
    return Davi<Person>(_model, columnWidthBehavior: ColumnWidthBehavior.fit);
  }
  //@demoflu_end:davi
}
