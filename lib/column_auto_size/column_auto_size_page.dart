import 'package:davi_demo/column_auto_size/column_auto_size_example.dart';
import 'package:davi_demo/macros.dart';
import 'package:demoflu/demoflu.dart';
import 'package:flutter/widgets.dart';

class ColumnAutoSizePage extends DemoFluPage {
  @override
  void buildSections(BuildContext context, PageSections sections) {
    final String source = 'lib/column_auto_size/column_auto_size_example.dart';

    sections.text(
        text: 'With initialAutoSize, the column width is adjusted once to fit'
            ' its content, as soon as there are rows to display. Only the'
            ' header and the cells of the rows visible in the viewport are'
            ' considered, limited by maxAutoSizeWidth. Rows outside the'
            ' scroll area are not measured, so a longer value in one of them'
            ' is not considered.');

    sections.code(source, mark: 'columns', loadMode: LoadMode.readOnlyMarked);

    sections.text(
        text: 'Rows added later don\'t change the width. To adjust it again,'
            ' double click the resize area on the right side of a column'
            ' header, or call autoSizeColumns to adjust all resizable'
            ' columns. Both consider the rows visible at that moment.');

    sections.code(source, mark: 'button', loadMode: LoadMode.readOnlyMarked);

    sections.infoBanner(
        text: 'Auto size only works with ColumnWidthBehavior.scrollable'
            ' (the default). In ColumnWidthBehavior.fit, the columns always'
            ' fill the available width.');

    sections.widget((context) => const ColumnAutoSizeExample(),
        title: 'Example:')
      ..runMacro(id: Macros.example, context: context)
      ..linkToSource(file: source);
  }
}
