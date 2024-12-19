import 'package:davi_demo/column_width/column_width_example.dart';
import 'package:davi_demo/macros.dart';
import 'package:demoflu/demoflu.dart';
import 'package:flutter/widgets.dart';

class ColumnWidthPage extends DemoFluPage {
  @override
  void buildSections(BuildContext context,PageSections sections) {

    sections.text()
      ..add('The columns can be configured to either fit the available')
      ..add(' space or be resizable, depending on the value of the enum.');

    sections.infoBanner().addStyled(
        text:
            'The default value of `grow` is 1, and the default value of `ColumnWidthBehavior` is `scrollable`.',
        boldDelimiter: '`');

    sections.heading('ColumnWidthBehavior.scrollable');

    sections.text()
      ..add('If the total column width is greater than the available width,')
      ..add(' horizontal scrolling is displayed.');

    sections.text()
      ..add('When it is smaller, the remaining width will be stretched')
      ..add(' to fill the space according to the value of the grow attribute.')
      ..add(' This stretching based on grow will only occur the first time')
      ..add(' a column is laid out.');

    sections.text()
      ..add(' For newly added columns, this behavior will apply during')
      ..add(' their initial layout.')
      ..add(' Afterward, columns can be resized manually')
      ..add(' like any other.');

    sections.code('lib/column_width/column_width_example.dart',
        mark: 'scrollable-model',
        loadMode: LoadMode.readOnlyMarked,
        title: 'Model:');

    sections.code('lib/column_width/column_width_example.dart',
        mark: 'scrollable-davi',
        loadMode: LoadMode.readOnlyMarked,
        title: 'Widget:');

    sections
        .widget((context) => const ScrollableExample(), title: 'Example:')
        .runMacro(id: Macros.horizontalExample, context: context);

    sections.heading('ColumnWidthBehavior.fit');

    sections.text()
      ..add('All columns fit the available width with')
      ..add(' no horizontal scroll and cannot be resized.');

    sections.code('lib/column_width/column_width_example.dart',
        mark: 'fit-model', loadMode: LoadMode.readOnlyMarked, title: 'Model:');

    sections.code('lib/column_width/column_width_example.dart',
        mark: 'fit-davi', loadMode: LoadMode.readOnlyMarked, title: 'Widget:');

    sections
        .widget((context) => const FitExample(), title: 'Example:')
        .runMacro(id: Macros.horizontalExample, context: context);

  }
}
