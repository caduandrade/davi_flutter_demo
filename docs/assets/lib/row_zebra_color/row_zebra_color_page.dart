import 'package:davi_demo/macros.dart';
import 'package:davi_demo/row_zebra_color/row_zebra_color_example.dart';
import 'package:demoflu/demoflu.dart';
import 'package:flutter/widgets.dart';

class RowZebraColorPage extends DemoFluPage {
  @override
  void buildSections(BuildContext context, PageSections sections) {
    final String source = 'lib/row_zebra_color/row_zebra_color_example.dart';
    sections.code(source, mark: 'code', loadMode: LoadMode.readOnlyMarked);

    sections
        .widget((context) => const RowZebraColorExample(), title: 'Example:')
        .runMacro(id: Macros.example, context: context);

    sections.code(source, discardMarks: true, title: 'Full code:');
  }
}
