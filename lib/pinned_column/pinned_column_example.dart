import 'package:davi/davi.dart';
import 'package:flutter/material.dart';

class PinnedColumnExample extends StatefulWidget {
  const PinnedColumnExample({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => PinnedColumnExampleState();
}

class PinnedColumnExampleState extends State<PinnedColumnExample> {
  late DaviModel<String> _model;

  @override
  void initState() {
    super.initState();

    List<String> rows = ['Landon', 'Sari', 'Julian', 'Carey', 'Cadu', 'Delmar'];

    List<DaviColumn<String>> columns = [];
    //@demoflu_start:1
    columns.add(DaviColumn(
        pinStatus: PinStatus.left,
        width: 30,
        cellIcon: (person, index) => CellIcon(Icons.edit, size: 16)));
    //@demoflu_end:1
    columns.add(DaviColumn(name: 'Name', cellValue: (row, rowIndex)=>row));
    for (int i = 1; i < 10; i++) {
      columns.add(DaviColumn(
          name: 'Column $i', cellValue: (row, rowIndex) => row.hashCode+i));
    }
    _model = DaviModel(rows: rows, columns: columns);
  }

  @override
  Widget build(BuildContext context) {
    return Davi<String>(_model, visibleRowsCount: 6,);
  }
}
