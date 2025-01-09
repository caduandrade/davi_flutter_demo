import 'package:davi/davi.dart';
import 'package:flutter/material.dart';

class Person {
  Person(this.name, this.value);

  final String name;
  final int value;

  bool _valid = true;

  bool get valid => _valid;

  String _editable = '';

  String get editable => _editable;

  set editable(String value) {
    _editable = value;
    _valid = _editable.length < 6;
  }
}

class CellEditExample extends StatefulWidget {
  const CellEditExample({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => CellEditExampleState();
}

class CellEditExampleState extends State<CellEditExample> {
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
      DaviColumn(name: 'Name', cellValue: (row, rowIndex) => row.name),
      DaviColumn(name: 'Value', cellValue: (row, rowIndex) => row.value),
      DaviColumn(
          name: 'Editable',
          cellWidget: _fieldBuilder,
          cellBackground: (row, rowIndex, hovered) =>
              row.valid ? null : Colors.red[800])
    ]);
  }

  Widget _fieldBuilder(BuildContext context, Person person, int rowIndex) {
    return TextFormField(
        initialValue: person.editable,
        style: TextStyle(color: person.valid ? Colors.black : Colors.white),
        onChanged: (value) => _onFieldChange(value, person));
  }

  void _onFieldChange(String value, Person person) {
    final wasValid = person.valid;
    person.editable = value;
    if (wasValid != person.valid) {
      setState(() {
        // rebuild
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Davi<Person>(_model,visibleRowsCount: 6);
  }
}
