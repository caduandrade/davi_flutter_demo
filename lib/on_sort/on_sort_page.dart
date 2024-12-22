import 'package:davi_demo/macros.dart';
import 'package:davi_demo/on_sort/on_sort_example.dart';
import 'package:demoflu/demoflu.dart';
import 'package:flutter/widgets.dart';

class OnSortPage extends DemoFluPage{

  @override
  void buildSections(BuildContext context,PageSections sections) {
    final String source = 'lib/on_sort/on_sort_example.dart';

    sections
        .widget((context) => const OnSortExample(), title: 'Example:')
        .runMacro(id: Macros.horizontalExample, context: context);

    sections.code(source,
        discardMarks: true, title: 'Full code:');
  }

}