import 'package:davi_demo/macros.dart';
import 'package:davi_demo/row_color/row_color_example.dart';
import 'package:demoflu/demoflu.dart';
import 'package:flutter/widgets.dart';

class RowColorPage extends DemoFluPage{
  @override
  void buildSections(BuildContext context,PageSections sections) {
    sections.code('lib/row_color/row_color_example.dart',
        mark: 'code', loadMode: LoadMode.readOnlyMarked);

    sections
        .widget((context) => const RowColorExample(), title: 'Example:')
        .runMacro(id: Macros.horizontalExample, context: context);

    sections.code('lib/row_color/row_color_example.dart',
        discardMarks: true, title: 'Full code:');
  }

}