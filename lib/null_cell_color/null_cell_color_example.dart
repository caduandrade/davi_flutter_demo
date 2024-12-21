import 'package:davi/davi.dart';
import 'package:demoflu/demoflu.dart';
import 'package:flutter/material.dart';


class Person {
  Person(this.name, this.mobile);

  final String name;
  final String? mobile;
}

class MainWidget extends StatefulWidget {
  const MainWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MainWidgetState();
}

class MainWidgetState extends State<MainWidget> {
  late DaviModel<Person> _model;

  @override
  void initState() {
    super.initState();

    List<Person> rows =[
      Person('Landon', '+321 321-432-543'),
      Person('Sari', '+123 456-789-012'),
      Person('Julian', null),
      Person('Carey', '+111 222-333-444'),
      Person('Cadu', null),
      Person('Delmar', '+22 222-222-222')
    ];

    _model = DaviModel<Person>(rows: rows, columns: [
      DaviColumn(name: 'Name', cellValue: (row,index) => row.name),
      DaviColumn(name: 'Mobile', width: 150, cellValue: (row,index) => row.mobile)
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return DaviTheme(
        data: DaviThemeData(
            cell: CellThemeData(
                nullValueColor: ((rowIndex, hovered) => Colors.grey[300]))),
        child: Davi<Person>(_model));
  }
}
