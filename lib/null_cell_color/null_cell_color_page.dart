import 'package:davi_demo/macros.dart';
import 'package:davi_demo/null_cell_color/null_cell_color_example.dart';
import 'package:demoflu/demoflu.dart';
import 'package:flutter/widgets.dart';

class NullCellColorPage extends DemoFluPage{

  @override
  void buildSections(BuildContext context,PageSections sections) {
    final String source = 'lib/null_cell_color/null_cell_color_example.dart';
    sections.code(source,
        mark: 'code', loadMode: LoadMode.readOnlyMarked);

    sections
        .widget((context) => const NullCellColorExample(), title: 'Example:')
        .runMacro(id: Macros.horizontalExample, context: context);

    sections.code(source,
        discardMarks: true, title: 'Full code:');
  }

}