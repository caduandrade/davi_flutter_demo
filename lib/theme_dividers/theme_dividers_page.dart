import 'package:davi_demo/macros.dart';
import 'package:davi_demo/theme_dividers/theme_dividers_example.dart';
import 'package:demoflu/demoflu.dart';
import 'package:flutter/widgets.dart';

class ThemeDividersPage extends DemoFluPage {
  @override
  void buildSections(BuildContext context, PageSections sections) {
    final String source = 'lib/theme_dividers/theme_dividers_example.dart';
    sections.code(source, mark: 'code', loadMode: LoadMode.readOnlyMarked);

    sections.widget((context) => const ThemeDividerExample(), title: 'Example:')
      ..runMacro(id: Macros.horizontalExample, context: context)
      ..linkToSource(file: source);
  }
}
