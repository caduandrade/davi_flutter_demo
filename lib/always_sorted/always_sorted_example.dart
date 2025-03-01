import 'package:davi/davi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Person {
  Person(this.name, this.age, this.weight);

  final String name;
  final int age;
  final double weight;
}

class AlwaysSortedExample extends StatefulWidget {
  const AlwaysSortedExample({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => AlwaysSortedExampleState();
}

class AlwaysSortedExampleState extends State<AlwaysSortedExample> {
  late DaviModel<Person> _model;

  @override
  void initState() {
    super.initState();
    List<Person> rows = [
      Person('Carolyn', 22, 17),
      Person('Cornell', 22, 20.1),
      Person('Christine', 37, 18.6),
      Person('Carey', 37, 23),
      Person('Cadu', 43, 27.2),
      Person('Catherine', 43, 25.3)
    ];
    _model = DaviModel(
        rows: rows,
        columns: [
          DaviColumn(name: 'Name', cellValue: (params) => params.data.name),
          DaviColumn(name: 'Age', cellValue: (params) => params.data.age),
          DaviColumn(
              name: 'Weight',
              width: 120,
              cellValue: (params) => params.data.weight)
        ],
        sortingMode: SortingMode.alwaysSorted);
  }

  @override
  Widget build(BuildContext context) {
    return Davi(_model, visibleRowsCount: 6);
  }
}
