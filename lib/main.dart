import 'package:demoflu/demoflu.dart';
import 'package:easy_table_demo/custom_cell.dart';
import 'package:easy_table_demo/get_started.dart';
import 'package:flutter/material.dart';

void main() {
  Size? maxSize;
  // maxSize = const Size(400, 200);
  runApp(DemoFluApp(
      title: 'EasyTable (0.3.0)',
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
              name: 'Custom cell',
              builder: () => CustomCellExample(),
              codeFile: 'lib/custom_cell.dart',
              maxSize: maxSize,
              indentation: 1)
        ];
      }));
}
