import 'package:davi_demo/always_sorted/always_sorted_example.dart';
import 'package:davi_demo/macros.dart';
import 'package:demoflu/demoflu.dart';
import 'package:flutter/widgets.dart';

class AlwaysSortedPage extends DemoFluPage{

  @override
  void buildSections(BuildContext context,PageSections sections) {
    final String source = 'lib/always_sorted/always_sorted_example.dart';
    sections
        .widget((context) => const AlwaysSortedExample(), title: 'Example:')
        .runMacro(id: Macros.horizontalExample, context: context);

    sections.code(source,
        discardMarks: true, title: 'Full code:');
  }

}