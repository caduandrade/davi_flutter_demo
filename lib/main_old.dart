import 'package:davi_demo/all_row_colors/all_row_colors.dart';
import 'package:davi_demo/always_sorted/always_sorted.dart';
import 'package:davi_demo/cell_edit/cell_edit.dart';
import 'package:davi_demo/cell_style/cell_style.dart';
import 'package:davi_demo/custom_cell_widget/custom_cell_widget.dart';
import 'package:davi_demo/infinite_scroll/infinite_scroll.dart';
import 'package:davi_demo/multi_sort/multi_sort.dart';
import 'package:davi_demo/null_cell_color/null_cell_color.dart';
import 'package:davi_demo/on_sort/on_sort.dart';
import 'package:davi_demo/row_fill_height/row_fill_height.dart';
import 'package:davi_demo/row_hover_color/row_hover_background.dart';
import 'package:davi_demo/examples/row_hover_foreground.dart';
import 'package:davi_demo/row_hover_listener/row_hover_listener_example.dart';
import 'package:davi_demo/row_zebra_color/row_zebra_color.dart';
import 'package:davi_demo/scrollbar_always_visible/scrollbar_always_visible.dart';
import 'package:davi_demo/examples/server_side_sorting.dart';
import 'package:davi_demo/theme_dividers/theme_dividers.dart';
import 'package:davi_demo/theme_header/theme_header.dart';
import 'package:davi_demo/theme_hidden_header/theme_hidden_header.dart';
import 'package:davi_demo/theme_row_color/theme_row_color.dart';
import 'package:davi_demo/theme_scrollbars/theme_scrollbars.dart';
import 'package:demoflu/demoflu.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(DemoFluApp(
    // maxSize : const Size(401, 191),
      title: 'Davi (3.2.0)',
      menuItems: _menuItems()));
}

List<DemoMenuItem> _menuItems() {
  var builder = DemoMenuItem.builder();
  builder
    ..indent(1)
    ..add('Model')
    ..indent(2)
    ..add('Row')
    ..indent(3)
    ..add('Infinite scroll', example: InfiniteScrollExample())
    ..indent(2)
    ..add('Cell')
    ..indent(3)
    ..add('Cell style', example: CellStyleExample())
    ..add('Custom cell widget', example: CustomCellWidgetExample())
    ..add('Cell edit', example: CellEditExample())
    ..indent(2)
    ..add('Sort')
    ..indent(3)
    ..add('Multiple sort', example: MultiSortExample())
    ..add('On sort', example: OnSortExample())
    ..add('Server-side sorting', example: ServerSideSortingExample())
    ..add('Always sorted', example: AlwaysSortedExample())
    ..indent(1)
    ..add('Theme')
    ..indent(2)
    ..add('Dividers thickness and color', example: ThemeDividerExample())
    ..add('Header', example: ThemeHeaderExample())
    ..indent(3)
    ..add('Hidden header', example: ThemeHiddenHeaderExample())
    ..indent(2)
    ..add('Row')
    ..indent(3)
    ..add('Row color', example: ThemeRowColorExample())
    ..add('Row zebra color', example: RowZebraColorExample())
    ..add('Row hover background', example: RowHoverBackgroundExample())
    ..add('Row hover foreground', example: RowHoverForegroundExample())
    ..add('Row fill height', example: RowFillHeightExample())
    ..indent(2)
    ..add('Scrollbar', example: ThemeScrollbarsExample())
    ..indent(3)
    ..add('Scrollbar always visible', example: ScrollbarAlwaysVisibleExample())
    ..indent(2)
    ..add('Cell')
    ..indent(3)
    ..add('Null value color', example: NullCellColorExample())
    ..indent(1)
    ..add('Combining settings')
    ..indent(2)
    ..add('Row colors', example: AllRowColorsExample());
  return builder.menuItems;
}
