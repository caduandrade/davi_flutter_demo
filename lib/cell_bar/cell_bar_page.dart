import 'package:davi_demo/cell_bar/cell_bar_example.dart';
import 'package:davi_demo/cell_bar/custom_cell_bar_example.dart';
import 'package:davi_demo/macros.dart';
import 'package:demoflu/demoflu.dart';
import 'package:flutter/widgets.dart';

class CellBarPage extends DemoFluPage {
  @override
  void buildSections(BuildContext context, PageSections sections) {
    String source = 'lib/cell_bar/cell_bar_example.dart';

    sections.code(source, mark: 'code', loadMode: LoadMode.readOnlyMarked);

    sections.widget((context) => const CellBarExample(), title: 'Example:')
      ..runMacro(id: Macros.horizontalExample, context: context)
      ..linkToSource(file: source);

    sections.heading("Customization");
    source = 'lib/cell_bar/custom_cell_bar_example.dart';

    sections.code(source, mark: 'code', loadMode: LoadMode.readOnlyMarked);

    sections.widget((context) => const CustomCellBarExample(),
        title: 'Example:')
      ..runMacro(id: Macros.horizontalExample, context: context)
      ..linkToSource(file: source);
  }
}
