import 'package:davi_demo/custom_cell_widget/custom_cell_widget_example.dart';
import 'package:davi_demo/macros.dart';
import 'package:demoflu/demoflu.dart';
import 'package:flutter/widgets.dart';

class CustomCellWidgetPage extends DemoFluPage {
  @override
  void buildSections(BuildContext context, PageSections sections) {
    final String source =
        'lib/custom_cell_widget/custom_cell_widget_example.dart';

    sections.code(source, mark: 'code', loadMode: LoadMode.readOnlyMarked);

    sections.widget((context) => const CustomCellWidgetExample(),
        title: 'Example:')
      ..runMacro(id: Macros.noHeightExample, context: context)
      ..linkToSource(file: source);
  }
}
