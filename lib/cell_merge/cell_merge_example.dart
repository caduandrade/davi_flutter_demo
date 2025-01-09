import 'package:davi/davi.dart';
import 'package:flutter/material.dart';

class ScheduleRow {
  final String period;
  final String? mondayClass;
  final int mondayDuration;
  final String? tuesdayClass;
  final int tuesdayDuration;
  final String? wednesdayClass;
  final int wednesdayDuration;
  final String? thursdayClass;
  final int thursdayDuration;
  final String? fridayClass;
  final int fridayDuration;
  final bool allWeek;

  ScheduleRow(
      {required this.period,
      this.mondayClass,
      this.mondayDuration = 1,
      this.tuesdayClass,
      this.tuesdayDuration = 1,
      this.wednesdayClass,
      this.wednesdayDuration = 1,
      this.thursdayClass,
      this.thursdayDuration = 1,
      this.fridayClass,
      this.fridayDuration = 1,
      this.allWeek = false});
}

class CellMergeExample extends StatefulWidget {
  const CellMergeExample({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => CellMergeExampleState();
}

class CellMergeExampleState extends State<CellMergeExample> {
  late DaviModel<ScheduleRow> _model;

  @override
  void initState() {
    super.initState();

    List<ScheduleRow> rows = [
      ScheduleRow(
        period: "08:00-09:00",
        mondayClass: "Math",
        mondayDuration: 2,
        tuesdayClass: "History",
        wednesdayClass: "Math",
        thursdayClass: "Music",
        fridayClass: "English",
      ),
      ScheduleRow(
          period: "09:00-10:00",
          wednesdayClass: "Chemistry",
          thursdayClass: "Physics"),
      ScheduleRow(
        period: "10:00-11:00",
        mondayClass: "Physics",
        tuesdayClass: "Math",
        wednesdayClass: "Biology",
        wednesdayDuration: 2,
        thursdayClass: "Literature",
        thursdayDuration: 2,
        fridayClass: "English",
      ),
      ScheduleRow(
        period: "11:00-12:00",
        mondayClass: "Biology",
        tuesdayClass: "Literature",
        fridayClass: "Math",
      ),
      ScheduleRow(
          period: "12:00-01:00", mondayClass: "Lunch Break", allWeek: true),
      ScheduleRow(
        period: "01:00-02:00",
        mondayClass: "Economics",
        tuesdayClass: "English",
        wednesdayClass: "Geography",
        thursdayClass: "History",
        thursdayDuration: 2,
        fridayClass: "Chemistry",
      ),
      ScheduleRow(
        period: "02:00-03:00",
        mondayClass: "History",
        tuesdayClass: "Physics",
        fridayClass: "Art",
      ),
      ScheduleRow(
        period: "03:00-04:00",
        mondayClass: "Philosophy",
        tuesdayClass: "Philosophy",
        wednesdayClass: "Geography",
        thursdayClass: "Art",
        fridayClass: "Portuguese",
      ),
    ];

    _model = DaviModel(
        rows: rows,
        columns: [
          DaviColumn(name: 'Time', cellValue: (row, rowIndex) => row.period),
          //@demoflu_start:1
          DaviColumn(
              name: 'Monday',
              cellValue: (row, rowIndex) => row.mondayClass,
              rowSpan: (row, rowIndex) => row.mondayDuration,
              columnSpan: (row, rowIndex) => row.allWeek ? 5 : 1),
          //@demoflu_end:1
          DaviColumn(
              name: 'Tuesday',
              cellValue: (row, rowIndex) => row.tuesdayClass,
              rowSpan: (row, rowIndex) => row.thursdayDuration),
          DaviColumn(
              name: 'Wednesday',
              cellValue: (row, rowIndex) => row.wednesdayClass,
              rowSpan: (row, rowIndex) => row.wednesdayDuration),
          DaviColumn(
              name: 'Thursday',
              cellValue: (row, rowIndex) => row.thursdayClass,
              rowSpan: (row, rowIndex) => row.thursdayDuration),
          DaviColumn(
              name: 'Friday',
              cellValue: (row, rowIndex) => row.fridayClass,
              rowSpan: (row, rowIndex) => row.fridayDuration)
          //@demoflu_end:model
        ],
        sortingMode: SortingMode.disabled);
  }

  @override
  Widget build(BuildContext context) {
    return DaviTheme(
        data: DaviThemeData(
            headerCell: HeaderCellThemeData(alignment: Alignment.center),
            cell: CellThemeData(
                alignment: Alignment.center,
                nullValueColor: (rowIndex, hovered) => Colors.grey[200])),
        child: Davi<ScheduleRow>(_model,
            columnWidthBehavior: ColumnWidthBehavior.fit, visibleRowsCount: 8));
  }
}
