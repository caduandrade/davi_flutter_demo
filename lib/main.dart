import 'package:demoflu/demoflu.dart';
import 'package:easy_table_demo/all_row_colors.dart';
import 'package:easy_table_demo/cell_style.dart';
import 'package:easy_table_demo/column_style.dart';
import 'package:easy_table_demo/columns_fit.dart';
import 'package:easy_table_demo/custom_cell_widget.dart';
import 'package:easy_table_demo/get_started.dart';
import 'package:easy_table_demo/infinite_scroll.dart';
import 'package:easy_table_demo/multi_sort.dart';
import 'package:easy_table_demo/null_cell_color.dart';
import 'package:easy_table_demo/pinned_column.dart';
import 'package:easy_table_demo/row_callbacks.dart';
import 'package:easy_table_demo/row_color.dart';
import 'package:easy_table_demo/row_cursor.dart';
import 'package:easy_table_demo/row_fill_height.dart';
import 'package:easy_table_demo/row_hover_background.dart';
import 'package:easy_table_demo/row_hover_foreground.dart';
import 'package:easy_table_demo/row_hover_listener.dart';
import 'package:easy_table_demo/row_zebra_color.dart';
import 'package:easy_table_demo/scrollbar_always_visible.dart';
import 'package:easy_table_demo/stretchable_column.dart';
import 'package:easy_table_demo/theme_dividers.dart';
import 'package:easy_table_demo/theme_header.dart';
import 'package:easy_table_demo/theme_hidden_header.dart';
import 'package:easy_table_demo/theme_row_color.dart';
import 'package:easy_table_demo/theme_scrollbars.dart';
import 'package:flutter/material.dart';

void main() {
  Size? maxSize;
  // maxSize = const Size(401, 191);
  runApp(DemoFluApp(
      title: 'EasyTable (2.3.0)',
      widgetBackground: Colors.white,
      resizable: true,
      appMenuBuilder: () {
        return [
          DemoMenuItem(
              name: 'Get started',
              builder: () => GetStartedExample(),
              codeFile: 'lib/get_started.dart',
              maxSize: maxSize,
              indentation: 1),
          DemoMenuItem(name: 'Column', indentation: 1, italic: true),
          DemoMenuItem(
              name: 'Columns fit',
              builder: () => ColumnsFitExample(),
              codeFile: 'lib/columns_fit.dart',
              maxSize: maxSize,
              indentation: 2),
          DemoMenuItem(
              name: 'Stretchable column',
              builder: () => StretchableColumnExample(),
              codeFile: 'lib/stretchable_column.dart',
              maxSize: maxSize,
              indentation: 2),
          DemoMenuItem(
              name: 'Multiple sort',
              builder: () => MultiSortExample(),
              codeFile: 'lib/multi_sort.dart',
              maxSize: maxSize,
              indentation: 2),
          DemoMenuItem(
              name: 'Column style',
              builder: () => ColumnStyleExample(),
              codeFile: 'lib/custom_cell_widget.dart',
              maxSize: maxSize,
              indentation: 2),
          DemoMenuItem(
              name: 'Pinned column',
              builder: () => PinnedColumnExample(),
              codeFile: 'lib/pinned_column.dart',
              maxSize: maxSize,
              indentation: 2),
          DemoMenuItem(name: 'Row', indentation: 1, italic: true),
          DemoMenuItem(
              name: 'Row color',
              builder: () => RowColorExample(),
              codeFile: 'lib/row_color.dart',
              maxSize: maxSize,
              indentation: 2),
          DemoMenuItem(
              name: 'Row cursor',
              builder: () => RowCursorExample(),
              codeFile: 'lib/row_cursor.dart',
              maxSize: maxSize,
              indentation: 2),
          DemoMenuItem(
              name: 'Row callbacks',
              builder: () => RowCallbacksExample(),
              codeFile: 'lib/row_callbacks.dart',
              maxSize: maxSize,
              consoleEnabled: true,
              indentation: 2),
          DemoMenuItem(
              name: 'Row hover listener',
              builder: () => RowHoverListenerExample(),
              codeFile: 'lib/row_hover_listener.dart',
              maxSize: maxSize,
              consoleEnabled: true,
              indentation: 2),
          DemoMenuItem(
              name: 'Infinite scroll',
              builder: () => InfiniteScrollExample(),
              codeFile: 'lib/infinite_scroll.dart',
              maxSize: maxSize,
              indentation: 2),
          DemoMenuItem(name: 'Cell', indentation: 1, italic: true),
          DemoMenuItem(
              name: 'Cell style',
              builder: () => CellStyleExample(),
              codeFile: 'lib/cell_style.dart',
              maxSize: maxSize,
              indentation: 2),
          DemoMenuItem(
              name: 'Custom cell widget',
              builder: () => CustomCellWidgetExample(),
              codeFile: 'lib/custom_cell_widget.dart',
              maxSize: maxSize,
              indentation: 2),
          DemoMenuItem(name: 'Theme', indentation: 1, italic: true),
          DemoMenuItem(
              name: 'Dividers thickness and color',
              builder: () => ThemeDividerExample(),
              codeFile: 'lib/theme_dividers.dart',
              maxSize: maxSize,
              indentation: 2),
          DemoMenuItem(
              name: 'Header',
              builder: () => ThemeHeaderExample(),
              codeFile: 'lib/theme_header.dart',
              maxSize: maxSize,
              indentation: 2),
          DemoMenuItem(
              name: 'Hidden header',
              builder: () => ThemeHiddenHeaderExample(),
              codeFile: 'lib/theme_hidden_header.dart',
              maxSize: maxSize,
              indentation: 3),
          DemoMenuItem(name: 'Row', indentation: 2, italic: true),
          DemoMenuItem(
              name: 'Row color',
              builder: () => ThemeRowColorExample(),
              codeFile: 'lib/theme_row_color.dart',
              maxSize: maxSize,
              indentation: 3),
          DemoMenuItem(
              name: 'Row zebra color',
              builder: () => RowZebraColorExample(),
              codeFile: 'lib/row_zebra_color.dart',
              maxSize: maxSize,
              indentation: 3),
          DemoMenuItem(
              name: 'Row hover background',
              builder: () => RowHoverBackgroundExample(),
              codeFile: 'lib/row_hover_background.dart',
              maxSize: maxSize,
              indentation: 3),
          DemoMenuItem(
              name: 'Row hover foreground',
              builder: () => RowHoverForegroundExample(),
              codeFile: 'lib/row_hover_foreground.dart',
              maxSize: maxSize,
              indentation: 3),
          DemoMenuItem(
              name: 'Row fill height',
              builder: () => RowFillHeightExample(),
              codeFile: 'lib/row_fill_height.dart',
              maxSize: maxSize,
              indentation: 3),
          DemoMenuItem(
              name: 'Scrollbar',
              builder: () => ThemeScrollbarsExample(),
              codeFile: 'lib/theme_scrollbars.dart',
              maxSize: maxSize,
              indentation: 2),
          DemoMenuItem(
              name: 'Scrollbar always visible',
              builder: () => ScrollbarAlwaysVisibleExample(),
              codeFile: 'lib/scrollbar_always_visible.dart',
              maxSize: maxSize,
              indentation: 3),
          DemoMenuItem(name: 'Cell', indentation: 2, italic: true),
          DemoMenuItem(
              name: 'Null value color',
              builder: () => NullCellColorExample(),
              codeFile: 'lib/null_cell_color.dart',
              maxSize: maxSize,
              indentation: 3),
          DemoMenuItem(
              name: 'Combining settings', indentation: 1, italic: true),
          DemoMenuItem(
              name: 'Row colors',
              builder: () => AllRowColorsExample(),
              codeFile: 'lib/all_row_colors.dart',
              maxSize: maxSize,
              indentation: 2)
        ];
      }));
}
