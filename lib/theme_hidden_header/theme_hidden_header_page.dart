import 'package:davi_demo/macros.dart';
import 'package:davi_demo/theme_hidden_header/theme_hidden_header_example.dart';
import 'package:demoflu/demoflu.dart';
import 'package:flutter/widgets.dart';

class ThemeHiddenHeaderPage extends DemoFluPage {
  @override
  void buildSections(BuildContext context, PageSections sections) {
    final String source =
        'lib/theme_hidden_header/theme_hidden_header_example.dart';
    sections.code(source, mark: 'code', loadMode: LoadMode.readOnlyMarked);

    sections.widget((context) => const ThemeHiddenHeaderExample(),
        title: 'Example:')
      ..runMacro(id: Macros.horizontalExample, context: context)
      ..linkToSource(file: source);
  }
}
