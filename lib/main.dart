import 'package:davi_demo/always_sorted/always_sorted_page.dart';
import 'package:davi_demo/cell_bar/cell_bar_page.dart';
import 'package:davi_demo/cell_edit/cell_edit_page.dart';
import 'package:davi_demo/cell_painter/cell_painter_page.dart';
import 'package:davi_demo/column_style/column_style_page.dart';
import 'package:davi_demo/column_width/column_width_page.dart';
import 'package:davi_demo/custom_cell_widget/custom_cell_page.dart';
import 'package:davi_demo/get_started/get_started_page.dart';
import 'package:davi_demo/infinite_scroll/infinite_scroll_page.dart';
import 'package:davi_demo/macros.dart';
import 'package:davi_demo/multi_sort/multi_sort_page.dart';
import 'package:davi_demo/null_cell_color/null_cell_color_page.dart';
import 'package:davi_demo/on_sort/on_sort_page.dart';
import 'package:davi_demo/pinned_column/pinned_column_page.dart';
import 'package:davi_demo/row_callbacks/row_callbacks_page.dart';
import 'package:davi_demo/row_color/row_color_page.dart';
import 'package:davi_demo/row_cursor/row_cursor_page.dart';
import 'package:davi_demo/row_fill_height/row_fill_height_page.dart';
import 'package:davi_demo/row_hover_color/row_hover_color_page.dart';
import 'package:davi_demo/row_hover_listener/row_hover_listener_page.dart';
import 'package:davi_demo/row_zebra_color/row_zebra_color_page.dart';
import 'package:davi_demo/scrollbar_always_visible/scrollbar_always_visible_page.dart';
import 'package:davi_demo/server_side_sorting/server_side_sorting_page.dart';
import 'package:davi_demo/theme_dividers/theme_dividers_page.dart';
import 'package:davi_demo/theme_header/theme_header_page.dart';
import 'package:davi_demo/theme_hidden_header/theme_hidden_header_page.dart';
import 'package:davi_demo/theme_row_color/theme_row_color_page.dart';
import 'package:davi_demo/theme_scrollbars/theme_scrollbars_page.dart';
import 'package:demoflu/demoflu.dart';
import 'package:flutter/material.dart';

void main() {
  DemoFluApp app = DemoFluApp(title: 'Davi (4.0.0)', rootMenus: _rootMenus);
  app.macro.widget(Macros.styleExample, (context, section) {
    section
      ..padding = const EdgeInsets.all(10)
      ..background = Colors.white
      ..solidBorder(color: Colors.grey[300]);
  });
  app.macro.widget(Macros.horizontalExample, (context, section) {
    section
      ..maxHeight = 350
      ..maxWidth = 600
      ..runMacro(id: Macros.styleExample, context: context);
  });
  app.macro.group(Macros.tryOut, (context, section) {
    section
      ..padding = const EdgeInsets.fromLTRB(16, 4, 16, 4)
      ..text(text: 'Try out here').marginLeft = 8
      ..bulletBorder(
          color: Colors.grey[600]!,
          iconColor: Colors.white,
          icon: Icons.gesture,
          thickness: 6,
          diameter: 32);
  });
  app.macro.text(Macros.textAfter, (context, section) {
    section
      ..padding = const EdgeInsets.all(16)
      ..marginLeft = 32
      ..arrowDownBorder(color: Colors.grey[600]);
  });
  app.run();
}

List<DemoMenuItem> get _rootMenus =>
    [_getStarted, _columns, _rows, _cells, _sort, _theme, _style];

DemoMenuItem get _getStarted =>
    DemoMenuItem('Get started', page: () => GetStartedPage());

// COLUMNS

DemoMenuItem get _columns =>
    DemoMenuItem('Columns', children: [_columnWidth, _pinnedColumn]);

DemoMenuItem get _columnWidth =>
    DemoMenuItem('Column width', page: () => ColumnWidthPage());

DemoMenuItem get _pinnedColumn =>
    DemoMenuItem('Pinned column', page: () => PinnedColumnPage());

// ROWS

DemoMenuItem get _rows => DemoMenuItem('Rows',
    children: [_rowCallbacks, _rowHoverListener, _infiniteScroll]);

DemoMenuItem get _rowCallbacks =>
    DemoMenuItem('Row callbacks', page: () => RowCallbacksPage());

DemoMenuItem get _rowHoverListener =>
    DemoMenuItem('Row hover listener', page: () => RowHoverListenerPage());

DemoMenuItem get _infiniteScroll =>
    DemoMenuItem('Infinite scroll', page: () => InfiniteScrollPage());

// CELLS

DemoMenuItem get _cells => DemoMenuItem('Cells',
    children: [_customCellWidget, _cellEdit, _cellBar, _cellPainter]);

DemoMenuItem get _customCellWidget =>
    DemoMenuItem('Custom cell widget', page: () => CustomCellWidgetPage());

DemoMenuItem get _cellEdit =>
    DemoMenuItem('Cell edit', page: () => CellEditPage());

DemoMenuItem get _cellBar =>
    DemoMenuItem('Percentage bar', page: () => CellBarPage());

DemoMenuItem get _cellPainter =>
    DemoMenuItem('Cell painter', page: () => CellPainterPage());

// SORT

DemoMenuItem get _sort => DemoMenuItem('Sort',
    children: [_alwaysSorted, _multiSort, _onSort, _serverSideSort]);

DemoMenuItem get _alwaysSorted =>
    DemoMenuItem('Always sorted', page: () => AlwaysSortedPage());

DemoMenuItem get _multiSort =>
    DemoMenuItem('Multi sort', page: () => MultiSortPage());

DemoMenuItem get _onSort => DemoMenuItem('On sort', page: () => OnSortPage());

DemoMenuItem get _serverSideSort =>
    DemoMenuItem('Server side sort', page: () => ServerSideSortingPage());

// THEME

DemoMenuItem get _theme => DemoMenuItem('Theme', children: [
      _themeDividers,
      _themeHeader,
      _themeRow,
      _themeScrollbar,
      _themeCell
    ]);

DemoMenuItem get _themeDividers => DemoMenuItem('Dividers thickness and color',
    page: () => ThemeDividersPage());

DemoMenuItem get _themeHeader => DemoMenuItem('Header',
    page: () => ThemeHeaderPage(), children: [_themeHiddenHeader]);

DemoMenuItem get _themeHiddenHeader =>
    DemoMenuItem('Hidden header', page: () => ThemeHiddenHeaderPage());

DemoMenuItem get _themeRow => DemoMenuItem('Row', children: [
      _themeRowColor,
      _themeRowZebraColor,
      _themeRowHoverColor,
      _themeRowFillHeight
    ]);

DemoMenuItem get _themeRowColor =>
    DemoMenuItem('Row color', page: () => ThemeRowColorPage());

DemoMenuItem get _themeRowZebraColor =>
    DemoMenuItem('Row zebra color', page: () => RowZebraColorPage());

DemoMenuItem get _themeRowHoverColor =>
    DemoMenuItem('Row hover color', page: () => RowHoverColorPage());
DemoMenuItem get _themeRowFillHeight =>
    DemoMenuItem('Row fill height', page: () => RowFillHeightPage());

DemoMenuItem get _themeScrollbar => DemoMenuItem('Scrollbar',
    page: () => ThemeScrollbarsPage(),
    children: [_themeScrollbarAlwaysVisible]);

DemoMenuItem get _themeScrollbarAlwaysVisible =>
    DemoMenuItem('Scrollbar always visible',
        page: () => ScrollbarAlwaysVisiblePage());

DemoMenuItem get _themeCell =>
    DemoMenuItem('Cell', children: [_themeNullCellColor]);

DemoMenuItem get _themeNullCellColor =>
    DemoMenuItem('Null cell color', page: () => NullCellColorPage());

// DATA-DRIVEN STYLE

DemoMenuItem get _style => DemoMenuItem('Data-driven style',
    children: [_rowColor, _rowCursor, _columnStyle]);

DemoMenuItem get _columnStyle =>
    DemoMenuItem('Column/Cell style', page: () => ColumnStylePage());

DemoMenuItem get _rowColor =>
    DemoMenuItem('Row color', page: () => RowColorPage());

DemoMenuItem get _rowCursor =>
    DemoMenuItem('Row cursor', page: () => RowCursorPage());
