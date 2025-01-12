import 'package:davi_demo/macros.dart';
import 'package:davi_demo/multi_sort/multi_sort_example.dart';
import 'package:demoflu/demoflu.dart';
import 'package:flutter/widgets.dart';

class MultiSortPage extends DemoFluPage {
  @override
  void buildSections(BuildContext context, PageSections sections) {
    final String source = 'lib/multi_sort/multi_sort_example.dart';

    sections.widget((context) => const MultiSortExample(), title: 'Example:')
      ..runMacro(id: Macros.noHeightExample, context: context)
      ..linkToSource(file: source);
  }
}
