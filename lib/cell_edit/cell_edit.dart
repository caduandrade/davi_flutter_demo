import 'package:davi/davi.dart';
import 'package:demoflu/demoflu.dart';
import 'package:flutter/material.dart';

class CellEditExample extends Example {
  CellEditExample()
      : super(
            widget: const MainWidget(),
            codeFile: 'lib/examples/cell_edit.dart');
}

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
      DaviColumn(name: 'Value', intValue: (row) => row.value),
      DaviColumn(
          name: 'Editable',
          cellBuilder: _buildField,
          cellBackground: (row) => row.data.valid ? null : Colors.red[800])
    ]);
  }

  Widget _buildField(BuildContext context, DaviRow<Person> row) {
    return TextFormField(
        initialValue: row.data.editable,
        style: TextStyle(color: row.data.valid ? Colors.black : Colors.white),
        onChanged: (value) => _onFieldChange(value, row.data));
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
    return Davi<Person>(_model);
  }
}
