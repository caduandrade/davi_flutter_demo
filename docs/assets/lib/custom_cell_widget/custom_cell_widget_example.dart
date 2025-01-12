import 'package:davi/davi.dart';
import 'package:flutter/material.dart';

class Person {
  Person(this.name, this.stars);

  final String name;
  final int stars;
}

class CustomCellWidgetExample extends StatefulWidget {
  const CustomCellWidgetExample({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => CustomCellWidgetExampleState();
}

class CustomCellWidgetExampleState extends State<CustomCellWidgetExample> {
  late DaviModel<Person> _model;

  @override
  void initState() {
    super.initState();
    List<Person> rows = [
      Person('Landon', 1),
      Person('Sari', 0),
      Person('Julian', 2),
      Person('Carey', 4),
      Person('Cadu', 5),
      Person('Delmar', 2)
    ];
    _model = DaviModel(rows: rows, columns: [
      DaviColumn(name: 'Name', cellValue: (params) => params.data.name),
      //@demoflu_start:code
      DaviColumn(
          name: 'Rate',
          width: 150,
          cellWidget: (params) => StarsWidget(stars: params.data.stars))
      //@demoflu_end:code
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Davi<Person>(_model, visibleRowsCount: 6);
  }
}

class StarsWidget extends StatelessWidget {
  const StarsWidget({Key? key, required this.stars}) : super(key: key);

  final int stars;

  @override
  Widget build(BuildContext context) {
    List<Widget> children = List.generate(
        stars,
        (index) =>
            const Flexible(child: Icon(Icons.star, color: Colors.orange)));
    return Row(children: children);
  }
}
