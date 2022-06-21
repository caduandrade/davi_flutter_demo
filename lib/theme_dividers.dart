import 'package:demoflu/demoflu.dart';
import 'package:easy_table/easy_table.dart';
import 'package:flutter/material.dart';

class ThemeDividerExample extends Example {
  @override
  Widget buildMainWidget(BuildContext context) => const MainWidget();
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
  EasyTableModel<Person>? _model;

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

    _model = EasyTableModel<Person>(rows: rows, columns: [
      EasyTableColumn(
          name: '',
          pinStatus: PinStatus.left,
          width: 30,
          cellBuilder: (context, data) => const Icon(Icons.edit, size: 16)),
      EasyTableColumn(name: 'Name', stringValue: (row) => row.name),
      EasyTableColumn(name: 'Age', intValue: (row) => row.age)
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return EasyTableTheme(
        child: EasyTable<Person>(_model),
        data: const EasyTableThemeData(
            columnDividerThickness: 4,
            columnDividerColor: Colors.blue,
            header: HeaderThemeData(columnDividerColor: Colors.purple),
            row: RowThemeData(dividerThickness: 4, dividerColor: Colors.green),
            scrollbar:
                TableScrollbarThemeData(columnDividerColor: Colors.orange)));
  }
}
