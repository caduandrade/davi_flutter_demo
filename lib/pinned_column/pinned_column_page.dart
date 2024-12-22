import 'package:davi_demo/macros.dart';
import 'package:davi_demo/pinned_column/pinned_column_example.dart';
import 'package:demoflu/demoflu.dart';
import 'package:flutter/widgets.dart';

class PinnedColumnPage extends DemoFluPage {
  @override
  void buildSections(BuildContext context, PageSections sections) {
    sections.text()
      ..add('A column with the pin status will remain always visible,')
      ..add(' regardless of horizontal scrolling.');

    sections.code('lib/pinned_column/pinned_column_example.dart',
        mark: 'model', loadMode: LoadMode.readOnlyMarked, title: 'Model:');

    sections
        .widget((context) => const PinnedColumnExample(), title: 'Example:')
        .runMacro(id: Macros.horizontalExample, context: context);

    sections.code('lib/pinned_column/pinned_column_example.dart',
        discardMarks: true, title: 'Full code:');
  }
}
