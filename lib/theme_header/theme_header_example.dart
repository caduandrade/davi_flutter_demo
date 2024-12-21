import 'package:davi/davi.dart';
import 'package:flutter/material.dart';



class Person {
  Person(this.name, this.age);

  final String name;
  final int age;
}

class ThemeHeaderExample extends StatefulWidget {
  const ThemeHeaderExample({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ThemeHeaderExampleState();
}

class ThemeHeaderExampleState extends State<ThemeHeaderExample> {
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
      DaviColumn(name: 'Name', cellValue: (row,index) => row.name),
      DaviColumn(name: 'Age', cellValue: (row,index) => row.age)
    ]);
  }

  //@demoflu_start:code
  @override
  Widget build(BuildContext context) {
    return DaviTheme(
        data: DaviThemeData(
            header: HeaderThemeData(
                color: Colors.green[50],
                bottomBorderThickness: 4,
                bottomBorderColor: Colors.blue),
            headerCell: HeaderCellThemeData(
                height: 40,
                alignment: Alignment.center,
                textStyle: const TextStyle(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
                resizeAreaWidth: 10,
                resizeAreaHoverColor: Colors.blue.withOpacity(.5),
                sortIconColors: SortIconColors.all(Colors.green),
                expandableName: false)),
        child: Davi<Person>(_model));
  }
  //@demoflu_end:code
}
