import 'package:davi_demo/cell_painter/cell_painter_example.dart';
import 'package:davi_demo/macros.dart';
import 'package:demoflu/demoflu.dart';
import 'package:flutter/widgets.dart';

class CellPainterPage extends DemoFluPage {
  @override
  void buildSections(BuildContext context, PageSections sections) {
    String source = 'lib/cell_painter/cell_painter_example.dart';

    sections.code(source, mark: 'code', loadMode: LoadMode.readOnlyMarked);

    sections.widget((context) => const CellPainterExample(), title: 'Example:')
      ..runMacro(id: Macros.horizontalExample, context: context)
      ..linkToSource(file: source);
  }
}
