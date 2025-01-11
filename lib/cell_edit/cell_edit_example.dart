import 'dart:math';

import 'package:davi/davi.dart';
import 'package:flutter/material.dart';

class Row {
  Row(this.id);

  final String id;

  bool get valid => editable.length < 6;

  String editable = '';
}

class CellEditExample extends StatefulWidget {
  const CellEditExample({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => CellEditExampleState();
}

class CellEditExampleState extends State<CellEditExample> {
  late DaviModel<Row> _model;

  @override
  void initState() {
    super.initState();
    Random random = Random();
    List<Row> rows = List.generate(
        100,
        (index) =>
            Row(random.nextInt(0xFFFFFF).toRadixString(16).toUpperCase()));
    _model = DaviModel(rows: rows, columns: [
      DaviColumn(name: 'ID', cellValue: (params) => params.data.id),
      //@demoflu_start:1
      DaviColumn(
          name: 'Editable',
          cellWidget: _fieldBuilder,
          cellBackground: (params) =>
              params.data.valid ? null : Colors.red[800])
      //@demoflu_end:1
    ]);
  }

  //@demoflu_start:2
  Widget _fieldBuilder(WidgetBuilderParams<Row> params) {
    return TextFormField(
        key: params.localKey,
        initialValue: params.data.editable,
        style:
            TextStyle(color: params.data.valid ? Colors.black : Colors.white),
        onChanged: (value) => _onFieldChange(value, params));
  }

  void _onFieldChange(String value, WidgetBuilderParams<Row> params) {
    final wasValid = params.data.valid;
    params.data.editable = value;
    if (wasValid != params.data.valid) {
      params.rebuildCallback();
    }
  }
  //@demoflu_end:2

  @override
  Widget build(BuildContext context) {
    return Davi<Row>(_model, visibleRowsCount: 6);
  }
}
