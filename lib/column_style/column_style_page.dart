import 'package:davi_demo/column_style/column_style_example.dart';
import 'package:davi_demo/macros.dart';
import 'package:demoflu/demoflu.dart';
import 'package:flutter/widgets.dart';

class ColumnStylePage extends DemoFluPage {
  @override
  void buildSections(BuildContext context, PageSections sections) {
    final String source = 'lib/column_style/column_style_example.dart';
    sections.code(source,
        mark: 'model', loadMode: LoadMode.readOnlyMarked, title: 'Model:');

    sections.widget((context) => const ColumnStyleExample(), title: 'Example:')
      ..runMacro(id: Macros.example, context: context)
      ..linkToSource(file: source);
  }
}
