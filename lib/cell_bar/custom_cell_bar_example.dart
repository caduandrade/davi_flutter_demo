import 'package:davi/davi.dart';
import 'package:flutter/material.dart';

class Person {
  Person(this.name, this.achievement);

  final String name;
  final double achievement;
}

class CustomCellBarExample extends StatefulWidget {
  const CustomCellBarExample({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => CustomCellBarExampleState();
}

class CustomCellBarExampleState extends State<CustomCellBarExample> {
  late DaviModel<Person> _model;

  @override
  void initState() {
    super.initState();
    List<Person> rows = [
      Person('Landon', 1),
      Person('Sari', 0.4),
      Person('Julian', 0.2),
      Person('Carey', 0.35),
      Person('Cadu', 0.85),
      Person('Delmar', 0.3)
    ];

    _model = DaviModel(rows: rows, columns: [
      DaviColumn(name: 'Name', cellValue: (row, rowIndex) => row.name),
      //@demoflu_start:code
      DaviColumn(
          cellPadding: EdgeInsets.all(4),
          name: 'Achievement',
          width: 150,
          cellBarValue: (row, rowIndex) => row.achievement,
          cellBarStyle: CellBarStyle(
              barBackground: Colors.transparent,
              barForeground: (value) {
                value = value.clamp(0.0, 1.0);
                return Color.lerp(Colors.grey, Colors.green, value)!;
              }))
      //@demoflu_end:code
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Davi<Person>(_model,visibleRowsCount: 6);
  }
}
