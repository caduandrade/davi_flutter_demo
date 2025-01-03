import 'package:davi_demo/macros.dart';
import 'package:davi_demo/row_cursor/row_cursor_example.dart';
import 'package:demoflu/demoflu.dart';
import 'package:flutter/widgets.dart';

class RowCursorPage extends DemoFluPage {
  @override
  void buildSections(BuildContext context, PageSections sections) {
    final String source = 'lib/row_cursor/row_cursor_example.dart';
    sections.code(source, mark: 'code', loadMode: LoadMode.readOnlyMarked);

    sections.widget((context) => const RowCursorExample(), title: 'Example:')
      ..runMacro(id: Macros.horizontalExample, context: context)
      ..linkToSource(file: source);
  }
}
