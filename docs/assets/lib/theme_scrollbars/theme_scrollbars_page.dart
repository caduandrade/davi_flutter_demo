import 'package:davi_demo/macros.dart';
import 'package:davi_demo/theme_scrollbars/theme_scrollbars_example.dart';
import 'package:demoflu/demoflu.dart';
import 'package:flutter/widgets.dart';

class ThemeScrollbarsPage extends DemoFluPage {
  @override
  void buildSections(BuildContext context, PageSections sections) {
    final String source = 'lib/theme_scrollbars/theme_scrollbars_example.dart';
    sections.code(source, mark: 'code', loadMode: LoadMode.readOnlyMarked);

    sections
        .widget((context) => const ThemeScrollbarsExample(), title: 'Example:')
        .runMacro(id: Macros.example, context: context);

    sections.code(source, discardMarks: true, title: 'Full code:');
  }
}
