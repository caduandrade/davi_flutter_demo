import 'package:davi_demo/macros.dart';
import 'package:davi_demo/theme_row_color/theme_row_color_example.dart';
import 'package:demoflu/demoflu.dart';
import 'package:flutter/widgets.dart';

class ThemeRowColorPage extends DemoFluPage{

  @override
  void buildSections(BuildContext context,PageSections sections) {
    final String source = 'lib/theme_row_color/theme_row_color_example.dart';
    sections.code(source,
        mark: 'code', loadMode: LoadMode.readOnlyMarked);

    sections
        .widget((context) => const ThemeRowColorExample(), title: 'Example:')
        .runMacro(id: Macros.horizontalExample, context: context);

    sections.code(source,
        discardMarks: true, title: 'Full code:');
  }

}