import 'package:davi/davi.dart';
import 'package:flutter/material.dart';

class Person {
  Person(this.name, this.min, this.max);

  final String name;
  final int min;
  final int max;

  double get ratio => min / max;
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
      Person('Landon', 1, 5),
      Person('Sari', 1, 10),
      Person('Julian', 2, 5),
      Person('Carey', 3, 4),
      Person('Cadu', 10, 15),
      Person('Delmar', 10, 20)
    ];

    _model = DaviModel(rows: rows, columns: [
      DaviColumn(name: 'Name', cellValue: (params) => params.data.name),
      //@demoflu_start:code
      DaviColumn(
          cellPadding: EdgeInsets.all(4),
          name: 'Min/Max',
          cellBarValue: (params) => params.data.ratio,
          cellBarStyle: CellBarStyle(
              barBackground: Colors.transparent,
              barForeground: (value) {
                return Color.lerp(Colors.grey, Colors.green, value)!;
              }),
          cellBarValueStringify: (params) =>
              '${params.data.min}/${params.data.max}')
      //@demoflu_end:code
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Davi<Person>(_model, visibleRowsCount: 6);
  }
}
