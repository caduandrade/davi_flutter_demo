import 'package:davi_demo/macros.dart';
import 'package:davi_demo/row_hover_color/row_hover_background.dart';
import 'package:davi_demo/row_hover_color/row_hover_foreground.dart';
import 'package:demoflu/demoflu.dart';
import 'package:flutter/widgets.dart';

class RowHoverColorPage extends DemoFluPage{

  @override
  void buildSections(BuildContext context,PageSections sections) {

    sections.heading('Background');

    final String backgroundSource = 'lib/row_hover_color/row_hover_background.dart';
    sections.code(backgroundSource,
        mark: 'code', loadMode: LoadMode.readOnlyMarked);

    sections
        .widget((context) => const RowHoverBackgroundExample(), title: 'Example:')
        .runMacro(id: Macros.horizontalExample, context: context);

    sections.code(backgroundSource,
        discardMarks: true, title: 'Full code:');

    sections.heading('Foreground');

    final String foregroundSource = 'lib/row_hover_color/row_hover_foreground.dart';
    sections.code(foregroundSource,
        mark: 'code', loadMode: LoadMode.readOnlyMarked);

    sections
        .widget((context) => const RowHoverForegroundExample(), title: 'Example:')
        .runMacro(id: Macros.horizontalExample, context: context);

    sections.code(foregroundSource,
        discardMarks: true, title: 'Full code:');
  }

}