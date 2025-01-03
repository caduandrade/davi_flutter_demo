import 'package:davi_demo/cell_edit/cell_edit_example.dart';
import 'package:davi_demo/macros.dart';
import 'package:demoflu/demoflu.dart';
import 'package:flutter/widgets.dart';

class CellEditPage extends DemoFluPage {
  @override
  void buildSections(BuildContext context, PageSections sections) {
    sections.widget((context) => const CellEditExample(), title: 'Example:')
      ..runMacro(id: Macros.horizontalExample, context: context)
      ..linkToSource(file: 'lib/cell_edit/cell_edit_example.dart');
  }
}
