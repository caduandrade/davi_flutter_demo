import 'package:davi_demo/cell_edit/cell_edit_example.dart';
import 'package:davi_demo/macros.dart';
import 'package:demoflu/demoflu.dart';
import 'package:flutter/widgets.dart';

class CellEditPage extends DemoFluPage {
  @override
  void buildSections(BuildContext context, PageSections sections) {
    final String source = 'lib/cell_edit/cell_edit_example.dart';
    sections.code(source, mark: '1', loadMode: LoadMode.readOnlyMarked);
    sections.code(source, mark: '2', loadMode: LoadMode.readOnlyMarked);
    sections.widget((context) => const CellEditExample(), title: 'Example:')
      ..runMacro(id: Macros.noHeightExample, context: context)
      ..linkToSource(file: source);
  }
}
