import 'package:davi/davi.dart';
import 'package:flutter/material.dart';

class Person {
  Person(this.name, this.value);

  final String name;
  final double value;
}

class CellPainterExample extends StatefulWidget {
  const CellPainterExample({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => CellPainterExampleState();
}

class CellPainterExampleState extends State<CellPainterExample> {
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
      DaviColumn(name: 'Name', cellValue: (params) => params.data.name),
      //@demoflu_start:code
      DaviColumn(
          cellPadding: EdgeInsets.all(4),
          name: 'Value',
          cellPainter: (Canvas canvas, Size size, Person person) {
            final Paint paint = Paint()..color = Colors.blue;
            canvas.drawLine(
              Offset.zero,
              Offset(size.width * person.value, size.height),
              paint,
            );
          })
      //@demoflu_end:code
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Davi<Person>(_model, visibleRowsCount: 6);
  }
}
