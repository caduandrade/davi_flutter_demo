import 'package:davi/davi.dart';
import 'package:flutter/material.dart';

class Person {
  Person(this.name, this.age);

  final String name;
  final int age;
}

class PinnedColumnExample extends StatefulWidget {
  const PinnedColumnExample({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => PinnedColumnExampleState();
}

class PinnedColumnExampleState extends State<PinnedColumnExample> {
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
    _model = DaviModel(rows: rows, columns: [
      DaviColumn(
          pinStatus: PinStatus.left,
          width: 30,
          cellIcon: (person, index) => CellIcon(Icons.edit, size: 16)),
      DaviColumn(name: 'Name', cellValue: (row, index) => row.name),
      DaviColumn(name: 'Age', cellValue: (row, index) => row.age)
    ]);
    //@demoflu_end:model
  }

  @override
  Widget build(BuildContext context) {
    return Davi<Person>(_model);
  }
}
