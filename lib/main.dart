import 'package:davi_demo/column_style/column_style_page.dart';
import 'package:davi_demo/column_width/column_width_page.dart';
import 'package:davi_demo/get_started/get_started_page.dart';
import 'package:davi_demo/macros.dart';
import 'package:davi_demo/pinned_column/pinned_column_page.dart';
import 'package:demoflu/demoflu.dart';
import 'package:flutter/material.dart';


void main() {
  DemoFluApp app =
  DemoFluApp(title: 'Davi (4.0.0)', rootMenus: _rootMenus);
  app.macro.widget(Macros.styleExample, (context, section) {
    section
      ..padding = const EdgeInsets.all(10)
      ..background = Colors.white
      ..solidBorder(color: Colors.grey[200]);
  });
  app.macro.widget(Macros.horizontalExample, (context, section) {
    section
      ..maxHeight = 350
      ..maxWidth = 600
      ..runMacro(id: Macros.styleExample, context: context);
  });
  app.macro.group(Macros.tryOut, (context, section) {
    section
      ..padding = const EdgeInsets.fromLTRB(16, 4, 16, 4)
      ..text(text: 'Try out here').marginLeft = 8
      ..bulletBorder(
          color: Colors.grey[600]!,
          iconColor: Colors.white,
          icon: Icons.gesture,
          thickness: 6,
          diameter: 32);
  });
  app.macro.text(Macros.textAfter, (context, section) {
    section
      ..padding = const EdgeInsets.all(16)
      ..marginLeft = 32
      ..arrowDownBorder(color: Colors.grey[600]);
  });
  app.run();
}

List<DemoMenuItem> get _rootMenus => [
  DemoMenuItem('Get started', page: () => GetStartedPage()),
  DemoMenuItem('Model', children: [DemoMenuItem('Column', children: [
    DemoMenuItem('Width', page: ()=>ColumnWidthPage()),
    DemoMenuItem('Style', page: ()=>ColumnStylePage()),
    DemoMenuItem('Pin',page: ()=>PinnedColumnPage())
  ])])
];
