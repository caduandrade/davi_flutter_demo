import 'package:davi_demo/macros.dart';
import 'package:demoflu/demoflu.dart';
import 'package:flutter/widgets.dart';

class CellStylePage extends DemoFluPage{

  @override
  void buildSections(BuildContext context,PageSections sections) {
    final String source = 'lib/_example.dart';
    sections.code(source,
        mark: 'code', loadMode: LoadMode.readOnlyMarked);

    sections
        .widget((context) => const Example(), title: 'Example:')
        .runMacro(id: Macros.horizontalExample, context: context);

    sections.code(source,
        discardMarks: true, title: 'Full code:');
  }

}