import 'package:davi_demo/column_style/column_style_example.dart';
import 'package:davi_demo/macros.dart';
import 'package:demoflu/demoflu.dart';
import 'package:flutter/widgets.dart';

class ColumnStylePage extends DemoFluPage {
  @override
  PageSections buildSections(BuildContext context) {
    PageSections sections = PageSections();

    sections.code('lib/column_style/column_style_example.dart',
        mark: 'model', loadMode: LoadMode.readOnlyMarked, title: 'Model:');

    sections
        .widget((context) => const Example(), title: 'Example:')
        .runMacro(id: Macros.horizontalExample, context: context);

    sections.code('lib/column_style/column_style_example.dart',
        discardMarks: true, title: 'Full code:');

    return sections;
  }
}
