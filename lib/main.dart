import 'package:demoflu/demoflu.dart';
import 'package:easy_table_demo/cell_style.dart';
import 'package:easy_table_demo/column_style.dart';
import 'package:easy_table_demo/columns_fit.dart';
import 'package:easy_table_demo/custom_cell_widget.dart';
import 'package:easy_table_demo/get_started.dart';
import 'package:easy_table_demo/null_cell_color.dart';
import 'package:easy_table_demo/pinned_column.dart';
import 'package:easy_table_demo/row_callbacks.dart';
import 'package:flutter/material.dart';

void main() {
  Size? maxSize;
  // maxSize = const Size(400, 201);
  runApp(DemoFluApp(
      title: 'EasyTable (1.3.0)',
      widgetBackground: Colors.white,
      resizable: true,
      appMenuBuilder: () {
        return [
          DemoMenuItem(
              name: 'Get started',
              builder: () => GetStartedExample(),
              codeFile: 'lib/get_started.dart',
              maxSize: maxSize,
              indentation: 1),
          DemoMenuItem(
              name: 'Columns fit',
              builder: () => ColumnsFitExample(),
              codeFile: 'lib/columns_fit.dart',
              maxSize: maxSize,
              indentation: 1),
          DemoMenuItem(
              name: 'Column style',
              builder: () => ColumnStyleExample(),
              codeFile: 'lib/custom_cell_widget.dart',
              maxSize: maxSize,
              indentation: 1),
          DemoMenuItem(
              name: 'Cell style',
              builder: () => CellStyleExample(),
              codeFile: 'lib/cell_style.dart',
              maxSize: maxSize,
              indentation: 1),
          DemoMenuItem(
              name: 'Custom cell widget',
              builder: () => CustomCellWidgetExample(),
              codeFile: 'lib/custom_cell_widget.dart',
              maxSize: maxSize,
              indentation: 1),
          DemoMenuItem(
              name: 'Row callbacks',
              builder: () => RowCallbacksExample(),
              codeFile: 'lib/row_callbacks.dart',
              maxSize: maxSize,
              consoleEnabled: true,
              indentation: 1),
          DemoMenuItem(name: 'Null values', indentation: 1),
          DemoMenuItem(
              name: 'Cell color',
              builder: () => NullCellColorExample(),
              codeFile: 'lib/null_cell_color.dart',
              maxSize: maxSize,
              indentation: 2),
          DemoMenuItem(
              name: 'Pinned column',
              builder: () => PinnedColumnExample(),
              codeFile: 'lib/pinned_column.dart',
              maxSize: maxSize,
              indentation: 1)
        ];
      }));
}
