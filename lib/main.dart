import 'package:demoflu/demoflu.dart';
import 'package:easy_table_demo/columns_fit.dart';
import 'package:easy_table_demo/custom_cell.dart';
import 'package:easy_table_demo/get_started.dart';
import 'package:easy_table_demo/null_cell_color.dart';
import 'package:easy_table_demo/row_callbacks.dart';
import 'package:flutter/material.dart';

void main() {
  Size? maxSize;
  // maxSize = const Size(400, 201);
  runApp(DemoFluApp(
      title: 'EasyTable (0.8.0)',
      widgetBackground: Colors.white,
      resizable: true,
      appMenuBuilder: () {
        return [
          MenuItem(
              name: 'Get started',
              builder: () => GetStartedExample(),
              codeFile: 'lib/get_started.dart',
              maxSize: maxSize,
              indentation: 1),
          MenuItem(
              name: 'Columns fit',
              builder: () => ColumnsFitExample(),
              codeFile: 'lib/columns_fit.dart',
              maxSize: maxSize,
              indentation: 1),
          MenuItem(
              name: 'Custom cell',
              builder: () => CustomCellExample(),
              codeFile: 'lib/custom_cell.dart',
              maxSize: maxSize,
              indentation: 1),
          MenuItem(
              name: 'Row callbacks',
              builder: () => RowCallbacksExample(),
              codeFile: 'lib/row_callbacks.dart',
              maxSize: maxSize,
              consoleEnabled: true,
              indentation: 1),
          MenuItem(name: 'Null values', indentation: 1),
          MenuItem(
              name: 'Cell color',
              builder: () => NullCellColorExample(),
              codeFile: 'lib/null_cell_color.dart',
              maxSize: maxSize,
              indentation: 2),
        ];
      }));
}
