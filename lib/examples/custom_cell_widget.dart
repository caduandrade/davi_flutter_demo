import 'package:davi/davi.dart';
import 'package:demoflu/demoflu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomCellWidgetExample extends Example {
  CustomCellWidgetExample()
      : super(
            widget: const MainWidget(),
            codeFile: 'lib/examples/custom_cell_widget.dart');
}

class Person {
  Person(this.name, this.stars);

  final String name;
  final int stars;
}

class MainWidget extends StatefulWidget {
  const MainWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MainWidgetState();
}

class MainWidgetState extends State<MainWidget> {
  DaviModel<Person>? _model;

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
    _model = DaviModel<Person>(rows: rows, columns: [
      DaviColumn(name: 'Name', stringValue: (row) => row.name),
      DaviColumn(
          name: 'Rate',
          width: 150,
          cellBuilder: (context, row) => StarsWidget(stars: row.data.stars))
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Davi<Person>(_model);
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
