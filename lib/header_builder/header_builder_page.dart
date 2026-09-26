import 'package:davi_demo/header_builder/header_builder_example.dart';
import 'package:davi_demo/macros.dart';
import 'package:demoflu/demoflu.dart';
import 'package:flutter/widgets.dart';

class HeaderBuilderPage extends DemoFluPage {
  @override
  void buildSections(BuildContext context, PageSections sections) {
    final String source = 'lib/header_builder/header_builder_example.dart';

    sections.text(
        text: 'The headerBuilder replaces the default Text(name) in the'
            ' column header. The leading widget and the sort icon are kept,'
            ' and the header height adapts to the content.');

    sections.code(source, mark: 'code', loadMode: LoadMode.readOnlyMarked);

    sections.code(source, mark: 'header', loadMode: LoadMode.readOnlyMarked);

    sections.widget((context) => const HeaderBuilderExample(),
        title: 'Example:')
      ..runMacro(id: Macros.example, context: context)
      ..linkToSource(file: source);
  }
}
