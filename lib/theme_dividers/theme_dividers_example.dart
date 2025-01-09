import 'package:davi/davi.dart';
import 'package:flutter/material.dart';

class Person {
  Person(this.name, this.age);

  final String name;
  final int age;
}

class ThemeDividerExample extends StatefulWidget {
  const ThemeDividerExample({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ThemeDividerExampleState();
}

class ThemeDividerExampleState extends State<ThemeDividerExample> {
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
      DaviColumn(
          name: '',
          pinStatus: PinStatus.left,
          width: 30,
          cellWidget: (context, row, rowIndex) =>
              const Icon(Icons.edit, size: 16)),
      DaviColumn(name: 'Name', cellValue: (row, rowIndex) => row.name),
      DaviColumn(name: 'Age', cellValue: (row, rowIndex) => row.age)
    ]);
  }

  //@demoflu_start:code
  @override
  Widget build(BuildContext context) {
    return DaviTheme(
        data: const DaviThemeData(
            columnDividerThickness: 4,
            columnDividerColor: Colors.blue,
            header: HeaderThemeData(columnDividerColor: Colors.purple),
            row: RowThemeData(dividerThickness: 4, dividerColor: Colors.green),
            scrollbar:
                TableScrollbarThemeData(columnDividerColor: Colors.orange)),
        child: Davi<Person>(_model));
  }
  //@demoflu_end:code
}
