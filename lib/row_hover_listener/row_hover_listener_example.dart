import 'package:davi/davi.dart';
import 'package:demoflu/demoflu.dart';
import 'package:flutter/material.dart';


class Person {
  Person(this.name, this.age);

  final String name;
  final int age;
}

class RowHoverListenerExample extends StatefulWidget {
  const RowHoverListenerExample({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => RowHoverListenerExampleState();
}

class RowHoverListenerExampleState extends State<RowHoverListenerExample> {
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
      DaviColumn(name: 'Name', cellValue: (person, index) => person.name),
      DaviColumn(name: 'Age', cellValue: (person, index) => person.age)
    ]);
  }

  //@demoflu_start:code
  @override
  Widget build(BuildContext context) {
    return Davi<Person>(_model, onHover: _onHover);
  }

  void _onHover(int? rowIndex) {
    print(rowIndex);
  }
  //@demoflu_end:code
}
