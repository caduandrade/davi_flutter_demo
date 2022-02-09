import 'package:demoflu/demoflu.dart';
import 'package:easy_table_demo/get_started.dart';
import 'package:flutter/material.dart';

void main() {
  Size? maxSize;
  //maxSize = Size(400, 300);
  runApp(DemoFluApp(
      title: 'EasyTable (0.1.0)',
      widgetBackground: Colors.white,
      resizable: true,
      appMenuBuilder: () {
        return [
          MenuItem(
              name: 'Get started',
              builder: () => GetStartedExample(),
              codeFile: 'lib/get_started.dart',
              maxSize: maxSize,
              indentation: 2)
        ];
      }));
}
