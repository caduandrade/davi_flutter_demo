import 'package:davi_demo/macros.dart';
import 'package:davi_demo/scrollbar_always_visible/scrollbar_always_visible_example.dart';
import 'package:demoflu/demoflu.dart';
import 'package:flutter/widgets.dart';

class ScrollbarAlwaysVisiblePage extends DemoFluPage{

  @override
  void buildSections(BuildContext context,PageSections sections) {
    final String source = 'lib/scrollbar_always_visible/scrollbar_always_visible_example.dart';
    sections.code(source,
        mark: 'code', loadMode: LoadMode.readOnlyMarked);

    sections
        .widget((context) => const ScrollbarAlwaysVisibleExample(), title: 'Example:')
        .runMacro(id: Macros.horizontalExample, context: context);

    sections.code(source,
        discardMarks: true, title: 'Full code:');
  }

}