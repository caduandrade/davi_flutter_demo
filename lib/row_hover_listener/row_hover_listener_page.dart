import 'package:davi_demo/macros.dart';
import 'package:davi_demo/row_hover_listener/row_hover_listener_example.dart';
import 'package:demoflu/demoflu.dart';
import 'package:flutter/widgets.dart';

class RowHoverListenerPage extends DemoFluPage {
  @override
  void buildSections(BuildContext context, PageSections sections) {
    final String source =
        'lib/row_hover_listener/row_hover_listener_example.dart';
    sections.code(source, mark: 'code', loadMode: LoadMode.readOnlyMarked);

    sections.widget((context) => const RowHoverListenerExample(),
        title: 'Example:')
      ..runMacro(id: Macros.example, context: context)
      ..linkToSource(file: source);

    sections.console();
  }
}
