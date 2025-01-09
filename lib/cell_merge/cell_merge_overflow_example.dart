import 'package:davi/davi.dart';
import 'package:flutter/material.dart';

class Data {
  Data({required this.name, required this.color, required this.rowSpan});

  final String name;
  final Color color;
  final int rowSpan;
}

class CellMergeOverflowExample extends StatefulWidget {
  const CellMergeOverflowExample(
      {Key? key,
      required this.collisionBehavior,
      required this.rowSpanOverflowBehavior})
      : super(key: key);

  final CellCollisionBehavior collisionBehavior;
  final RowSpanOverflowBehavior rowSpanOverflowBehavior;

  @override
  State<StatefulWidget> createState() => CellMergeOverflowExampleState();
}

class CellMergeOverflowExampleState extends State<CellMergeOverflowExample> {
  late DaviModel<Data> _model;

  @override
  void initState() {
    super.initState();
    List<Data> rows = [
      Data(name: 'blue (rowSpan 1)', color: Colors.blue, rowSpan: 1),
      Data(name: 'yellow (rowSpan 4)', color: Colors.yellow, rowSpan: 4)
    ];
    _model = DaviModel(
        rows: rows,
        sortingMode: SortingMode.alwaysSorted,
        collisionBehavior: widget.collisionBehavior,
        rowSpanOverflowBehavior: widget.rowSpanOverflowBehavior,
        columns: [
          DaviColumn(
              name: 'Value',
              cellWidget: (context, row, rowIndex) => CustomPaint(
                    painter: LinesPainter(color: row.color),
                    child: Center(child: Text(row.name)),
                  ),
              rowSpan: (row, rowIndex) => row.rowSpan,
              sortDirection: DaviSortDirection.descending,
              dataComparator: (valueA, valueB, rowA, rowB) =>
                  rowA.name.compareTo(rowB.name))
        ]);
  }

  @override
  void didUpdateWidget(covariant CellMergeOverflowExample oldWidget) {
    super.didUpdateWidget(oldWidget);
    _model.collisionBehavior = widget.collisionBehavior;
    _model.rowSpanOverflowBehavior = widget.rowSpanOverflowBehavior;
  }

  @override
  Widget build(BuildContext context) {
    return DaviTheme(
        data: DaviThemeData(
            row: RowThemeData(fillHeight: true),
            headerCell: HeaderCellThemeData(alignment: Alignment.center),
            cell: CellThemeData(
                alignment: Alignment.center,
                nullValueColor: (rowIndex, hovered) => Colors.grey[200])),
        child: Davi<Data>(_model,
            columnWidthBehavior: ColumnWidthBehavior.fit, visibleRowsCount: 8));
  }
}

class LinesPainter extends CustomPainter {
  LinesPainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 2.0;

    final double spacing = 30;

    for (double startX = -size.height; startX < size.width; startX += spacing) {
      if (color == Colors.blue) {
        canvas.drawLine(
          Offset(startX, 0),
          Offset(startX + size.height, size.height),
          paint,
        );
      } else if (color == Colors.yellow) {
        canvas.drawLine(
          Offset(startX, size.height),
          Offset(startX + size.height, 0),
          paint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
