import 'package:davi_demo/macros.dart';
import 'package:davi_demo/pinned_column/pinned_column_example.dart';
import 'package:demoflu/demoflu.dart';
import 'package:flutter/widgets.dart';

class PinnedColumnPage extends DemoFluPage {
  @override
  void buildSections(BuildContext context, PageSections sections) {
    final String source = 'lib/pinned_column/pinned_column_example.dart';
    sections.text()
      ..add('A column with the pin status will remain always visible,')
      ..add(' regardless of horizontal scrolling.');

    sections.code(source,
        mark: '1', loadMode: LoadMode.readOnlyMarked, title: 'Example:');

    sections.widget((context) => const PinnedColumnExample(), title: 'Example:')
      ..runMacro(id: Macros.noHeightExample, context: context)
      ..linkToSource(file: source);
  }
}
